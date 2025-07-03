package org.example;

import org.graalvm.polyglot.Context;
import org.graalvm.polyglot.HostAccess;
import org.graalvm.polyglot.Source;
import org.graalvm.polyglot.Value;
import org.springframework.core.io.ClassPathResource;

import java.io.IOException;
import java.net.URL;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.charset.StandardCharsets;

public class P1Loader {
    private final Value wasmModule;
    private final Value memory;
    private final Value realloc;
    private final Value reverse;
    private final Value concat;
    private final Value scaleImpl;

    private static final int POINT_SIZE = 4 + 4;

    public record Point(int x, int y) {
    }

    public P1Loader() throws IOException {
        Context context = Context.newBuilder().option("wasm.Builtins", "wasi_snapshot_preview1").allowHostAccess(HostAccess.ALL).build();
        URL wasmFile = new ClassPathResource("adder2.wasm").getURL();
        String moduleName = "main";
        context.eval(Source.newBuilder("wasm", wasmFile).name(moduleName).build());
        wasmModule = context.getBindings("wasm").getMember(moduleName);

        memory = wasmModule.getMember("memory");
        realloc = wasmModule.getMember("cabi_realloc");
        reverse = wasmModule.getMember("exports_docs_adder_simple_reverse");
        concat = wasmModule.getMember("exports_docs_adder_simple_concat");
        scaleImpl = wasmModule.getMember("exports_docs_adder_simple_scale_points");
    }

    public void dump(int ptr, int len) {
        if (!memory.hasArrayElements()) {
            System.err.println("Wasm memory does not support array elements");
            return;
        }
        System.out.printf("MEM[%d..%d):", ptr, ptr + len);
        for (int i = 0; i < len; i++) {
            int b = memory.getArrayElement(ptr + i).asInt() & 0xFF;
            System.out.printf(" %02x", b);
        }
        System.out.println();
    }

    int allocate(int size) {
        return realloc.execute(0, 0, 1, size).asInt();
    }

    void free(int ptr) {
        realloc.execute(ptr, 0, 1, 0);
    }

    private byte[] readBytes(int ptr, int len) {
        assert memory.hasArrayElements();
        byte[] data = new byte[len];
        for (int i = 0; i < len; i++) {
            data[i] = (byte) memory.getArrayElement(ptr + i).asInt();
        }
        return data;
    }

    void writeBytes(int ptr, byte[] data) {
        assert memory.hasArrayElements();
        for (int i = 0; i < data.length; i++) {
            // we write data[i] at index ptr + i
            memory.setArrayElement(ptr + i, (byte) (data[i] & 0xFF));
        }
    }

    record StringStruct(int ptr, int len) {
    }

    /// Method that will write the java string into Wasm memory and then
    /// will return a pointer to the memory location where the string was written
    /// along with the string length.
    private StringStruct writeStringToWasm(String s) {
        byte[] bs = s.getBytes(StandardCharsets.UTF_8);
        int ptr = allocate(bs.length);
        writeBytes(ptr, bs);
        return new StringStruct(ptr, bs.length);
    }

    public String readStringFromBuffer(StringStruct sb) {
        byte[] bs = readBytes(sb.ptr, sb.len);
        return new String(bs, StandardCharsets.UTF_8);
    }

    public String concat(String first, String second) {

        int firstCString = createCString(first);
        int secondCString = createCString(second);
        int resCString = allocate(8);

        concat.executeVoid(firstCString, secondCString, resCString);

        String result = fromCString(resCString);

        free(resCString);
        free(firstCString);
        free(secondCString);

        return result;
    }

    /// Method that will create a Java string from a CString
    /// parameter: strPtr is a pointer to the memory location
    /// where the CString is.
    private String fromCString(int strPtr) {
        // read all the bytes from the memory location where the pointer
        // is pointing to
        byte[] buf = readBytes(strPtr, 8);

        // reading the little endian wasm memory.
        ByteBuffer outputBufer = ByteBuffer.wrap(buf).order(ByteOrder.LITTLE_ENDIAN);
        int outPtr = outputBufer.getInt(0);
        int outLen = outputBufer.getInt(4);

        var res = readStringFromBuffer(new StringStruct(outPtr, outLen));
        free(outPtr);
        return res;
    }

    /// Method that will create a CString from a java string
    private int createCString(String s) {
        // first we want to write the java string in wasm memory!
        StringStruct inStr = writeStringToWasm(s);

        // allocate struct for string,
        // since the string struct in wasm is a uint8_t* pointer and a size_t
        // remember that sizeof(uint8_t) = 1 b ut sizeof(uint8_t*) = 4.
        // we have to allocate 8 bytes,
        // inStruct is an address pointing to an 8 byte wasm memory block.
        int inStruct = allocate(8);

        // pack (ptr,len) into the inStruct (c representation).
        // the bytebuffer will make sure that the data is laid out in
        // the linear order that wasm expects it to be.
        ByteBuffer inputBuffer = ByteBuffer.allocate(8).order(ByteOrder.LITTLE_ENDIAN);
        inputBuffer.putInt(inStr.ptr).putInt(inStr.len);

        // write inputBuffer.array into inStruct
        writeBytes(inStruct, inputBuffer.array());

        return inStruct;
    }

    public String reverse2(String x) {
        // Lowering parameter 'x' to wasm memory
        int temp0 = allocate(8);
        byte[] temp1 = x.getBytes(StandardCharsets.UTF_8);
        int temp2 = allocate(temp1.length);
        writeBytes(temp2, temp1);
        ByteBuffer temp3 = ByteBuffer.allocate(8).order(ByteOrder.LITTLE_ENDIAN);
        temp3.putInt(temp2).putInt(temp1.length);
        writeBytes(temp0, temp3.array());
        int result_ptr = allocate(8);
        wasmModule.getMember("exports_docs_adder_simple_reverse").executeVoid(temp0, result_ptr);
        // Lifting result from wasm memory
        byte[] temp5 = readBytes(result_ptr, 8);
        ByteBuffer temp6 = ByteBuffer.wrap(temp5).order(ByteOrder.LITTLE_ENDIAN);
        int temp7 = temp6.getInt(0);
        int temp8 = temp6.getInt(4);
        byte[] temp9 = readBytes(temp7, temp8);
        String temp4 = new String(temp9, StandardCharsets.UTF_8);
        free(temp7); // Free the string content memory allocated by Wasm
        free(temp2);
        free(temp0);

        return temp4;
    }

    public String reverse(String s) {
        int inStruct = createCString(s);

        // allocate output string.
        int outStruct = allocate(8);

        // call the C implementation
        reverse.executeVoid(inStruct, outStruct);
        // now the outStruct should hold the result
        String result = fromCString(outStruct);

        free(outStruct);
        free(inStruct);

        return result;
    }

    public Point[] scalePoints(Point[] pts, int scalar) {
        int count = pts.length;
        int dataSize = count * POINT_SIZE;
        int dataPtr = allocate(dataSize);

        ByteBuffer tmp = ByteBuffer.allocate(POINT_SIZE).order(ByteOrder.LITTLE_ENDIAN);
        for (int i = 0; i < count; i++) {
            tmp.clear();
            tmp.putInt(pts[i].x);
            tmp.putInt(pts[i].y);
            writeBytes(dataPtr + i * POINT_SIZE, tmp.array());
        }

        // now dataPtr contains the base address of the point list in wasm memory!

        int inListStruct = allocate(8);
        ByteBuffer pointListBuffer = ByteBuffer.allocate(8).order(ByteOrder.LITTLE_ENDIAN);
        pointListBuffer.putInt(dataPtr);
        pointListBuffer.putInt(count);
        writeBytes(inListStruct, pointListBuffer.array());

        // now inListStruct is ready to be given to c, we have constructed a Struct with linear memory.

        int outListStruct = allocate(8);

        scaleImpl.executeVoid(inListStruct, scalar, outListStruct);

        byte[] outBytes = readBytes(outListStruct, 8);
        ByteBuffer outputPointListBuffer = ByteBuffer.wrap(outBytes).order(ByteOrder.LITTLE_ENDIAN);
        int outDataPtr = outputPointListBuffer.getInt(0);
        int outLen = outputPointListBuffer.getInt(4);

        Point[] result = new Point[outLen];
        for (int i = 0; i < outLen; i++) {
            byte[] pBytes = readBytes(outDataPtr + i * POINT_SIZE, POINT_SIZE);
            ByteBuffer pb = ByteBuffer.wrap(pBytes).order(ByteOrder.LITTLE_ENDIAN);
            int x = pb.getInt(0);
            int y = pb.getInt(4);
            result[i] = new Point(x, y);
        }

        free(outDataPtr);
        free(outListStruct);
        free(inListStruct);
        free(dataPtr);

        return result;
    }
}
