package org.example;

import org.graalvm.polyglot.*;
import org.graalvm.polyglot.io.ByteSequence;
import java.io.IOException;
import java.net.URL;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.charset.StandardCharsets;

public class SimpleBindings {
    private final Value wasmModule;
    private final Value memory;
    private final Value cabi_realloc;

    public SimpleBindings(URL wasmResource, Context context) throws IOException {
        byte[] wasmBytes = wasmResource.openStream().readAllBytes();
        Source source = Source.newBuilder("wasm", ByteSequence.create(wasmBytes), "main").build();
        context.eval(source);

        this.wasmModule = context.getBindings("wasm").getMember("main");
        this.memory = wasmModule.getMember("memory");

        this.cabi_realloc = wasmModule.getMember("cabi_realloc");
    }

    private void writeBytes(int ptr, byte[] data) {
        for (int i = 0; i < data.length; i++) {
            memory.setArrayElement(ptr + i, data[i]);
        }
    }

    private int allocate(int size) {
        return cabi_realloc.execute(0, 0, 1, size).asInt();
    }

    private void free(int ptr) {
        cabi_realloc.execute(ptr, 0, 1, 0);
    }

    private byte[] readBytes(int ptr, int len) {
        byte[] data = new byte[len];
        for (int i = 0; i < len; i++) {
            data[i] = memory.getArrayElement(ptr + i).asByte();
        }
        return data;
    }

    private int createCString(String s) {
        byte[] bytes = s.getBytes(StandardCharsets.UTF_8);
        int stringPtr = allocate(bytes.length);
        writeBytes(stringPtr, bytes);

        int cstringStructPtr = allocate(8);

        ByteBuffer buffer = ByteBuffer.allocate(8).order(ByteOrder.LITTLE_ENDIAN);
        buffer.putInt(stringPtr);
        buffer.putInt(bytes.length);

        writeBytes(cstringStructPtr, buffer.array());
        return cstringStructPtr;
    }

    private String fromCString(int cstringStructPtr) {
        byte[] cstringBytes = readBytes(cstringStructPtr, 8);
        ByteBuffer buffer = ByteBuffer.wrap(cstringBytes).order(ByteOrder.LITTLE_ENDIAN);

        int stringPtr = buffer.getInt(0);
        int stringLen = buffer.getInt(4);

        byte[] stringBytes = readBytes(stringPtr, stringLen);
        free(stringPtr); // Free the inner string buffer

        return new String(stringBytes, StandardCharsets.UTF_8);
    }
    public int addInt(int x, int y) {
        wasmModule.getMember("exports_docs_adder_simple_add_int").executeVoid(x, y);

        int result = wasmModule.getMember("exports_docs_adder_simple_add_int").execute(x, y).asInt();

        return result;
    }

    public float addStr(float x, float y) {
        wasmModule.getMember("exports_docs_adder_simple_add_str").executeVoid(x, y);

        float result = wasmModule.getMember("exports_docs_adder_simple_add_str").execute(x, y).asFloat();

        return result;
    }

    public double addDouble(double x, double y) {
        wasmModule.getMember("exports_docs_adder_simple_add_double").executeVoid(x, y);

        double result = wasmModule.getMember("exports_docs_adder_simple_add_double").execute(x, y).asDouble();

        return result;
    }

    public String concat(String x, String y) {
        int cstring_x = createCString(x);
        int cstring_y = createCString(y);
        int resultCStringPtr = allocate(8);
        wasmModule.getMember("exports_docs_adder_simple_concat").executeVoid(cstring_x, cstring_y, resultCStringPtr);

        String result = fromCString(resultCStringPtr);

        free(resultCStringPtr);
        free(cstring_x);
        free(cstring_y);

        return result;
    }

    public String reverse(String x) {
        int cstring_x = createCString(x);
        int resultCStringPtr = allocate(8);
        wasmModule.getMember("exports_docs_adder_simple_reverse").executeVoid(cstring_x, resultCStringPtr);

        String result = fromCString(resultCStringPtr);

        free(resultCStringPtr);
        free(cstring_x);

        return result;
    }

    public String concatAgain(String x, String y, String z, String v) {
        int cstring_x = createCString(x);
        int cstring_y = createCString(y);
        int cstring_z = createCString(z);
        int cstring_v = createCString(v);
        int resultCStringPtr = allocate(8);
        wasmModule.getMember("exports_docs_adder_simple_concat_again").executeVoid(cstring_x, cstring_y, cstring_z, cstring_v, resultCStringPtr);

        String result = fromCString(resultCStringPtr);

        free(resultCStringPtr);
        free(cstring_x);
        free(cstring_y);
        free(cstring_z);
        free(cstring_v);

        return result;
    }

}
