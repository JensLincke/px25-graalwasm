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
    public final Value reverse;
    public final Value concat;

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
            var valToWrite = data[i] & 0xFF;
            memory.setArrayElement(ptr + i, valToWrite);
        }
    }

    record StrBuf(int ptr, int len) {
    }

    public StrBuf writeString(String s) {
        byte[] bs = s.getBytes(StandardCharsets.UTF_8);
        int ptr = allocate(bs.length);
        writeBytes(ptr, bs);
        return new StrBuf(ptr, bs.length);
    }

    public void dump(int ptr, int len) {
        System.out.printf("MEM[%d..%d):", ptr, ptr+len);
        for (int i = 0; i < len; i++) {
            int b = memory.getArrayElement(ptr + i).asInt() & 0xFF;
            System.out.printf(" %02x", b);
        }
        System.out.println();
    }

    public String readString(StrBuf sb) {
        byte[] bs = readBytes(sb.ptr, sb.len);
        return new String(bs, StandardCharsets.UTF_8);
    }

    public String concat(String first, String second) {

        StrBuf inFirst = writeString(first);
        StrBuf inSecond = writeString(second);

        int firstStruct = allocate(8);
        int secondStruct = allocate(8);
        int resStruct = allocate(8);

        ByteBuffer firstBuffer = ByteBuffer.allocate(8).order(ByteOrder.LITTLE_ENDIAN);
        firstBuffer.putInt(inFirst.ptr).putInt(inFirst.len());
        writeBytes(firstStruct, firstBuffer.array());
        ByteBuffer secondBuffer = ByteBuffer.allocate(8).order(ByteOrder.LITTLE_ENDIAN);
        secondBuffer.putInt(inSecond.ptr).putInt(inSecond.len());
        writeBytes(secondStruct, secondBuffer.array());

        ByteBuffer thirdBuffer = ByteBuffer.allocate(8).order(ByteOrder.LITTLE_ENDIAN);

        concat.executeVoid(firstStruct, secondStruct, resStruct);

        byte[] buf = readBytes(resStruct, 8);
        ByteBuffer resBuffer = ByteBuffer.wrap(buf).order(ByteOrder.LITTLE_ENDIAN);
        int outPtr = resBuffer.getInt(0);
        int outLen = resBuffer.getInt(4);
        System.out.printf("concat wrote → ptr=%d, len=%d%n", outPtr, outLen);
        String result = readString(new StrBuf(outPtr, outLen));
        return result;
    }

    public String reverse(String s) {
        // 1) copy input into Wasm memory
        StrBuf inStr = writeString(s);

        // 2) allocate struct for input and output (8 bytes each)
        int inStruct  = allocate(8);
        int outStruct = allocate(8);

        // 3) pack (ptr,len) into the in‐struct
        ByteBuffer ib = ByteBuffer.allocate(8).order(ByteOrder.LITTLE_ENDIAN);
        ib.putInt(inStr.ptr).putInt(inStr.len);
        writeBytes(inStruct, ib.array());

        // 4) call the C implementation
        reverse.executeVoid(inStruct, outStruct);

        // 5) dump and unpack the out‐struct
        byte[] buf = readBytes(outStruct, 8);
        ByteBuffer ob = ByteBuffer.wrap(buf).order(ByteOrder.LITTLE_ENDIAN);
        int outPtr = ob.getInt(0), outLen = ob.getInt(4);
        System.out.printf("reverse wrote → ptr=%d, len=%d%n", outPtr, outLen);

        // 6) read the reversed UTF-8 bytes
        String result = readString(new StrBuf(outPtr, outLen));

        // 7) free all allocated blocks
        free(outPtr);
        free(outStruct);
        free(inStruct);
        free(inStr.ptr);

        return result;
    }

}
