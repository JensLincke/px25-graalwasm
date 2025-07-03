package org.example;

import org.graalvm.polyglot.*;
import org.graalvm.polyglot.io.ByteSequence;
import java.io.IOException;
import java.net.URL;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

public class SimpleBindings {

    public record Point(int x, int y, double z) { }

    private final Value wasmModule;
    private final AdderInterface adderInterface;
    final int SIZEOF_U32 = 4;
    final int SIZEOF_F32 = 4;
    final int STRUCT_SIZE = 8;

    public SimpleBindings(URL wasmResource, Context context) throws IOException {
        byte[] wasmBytes = wasmResource.openStream().readAllBytes();
        Source source = Source.newBuilder("wasm", ByteSequence.create(wasmBytes), "main").build();
        context.eval(source);

        this.wasmModule = context.getBindings("wasm").getMember("main");
        this.adderInterface = wasmModule.as(AdderInterface.class);
    }

    private void writeBytes(int ptr, byte[] data) {
        for (int i = 0; i < data.length; i++) {
            adderInterface.memory().setArrayElement(ptr + i, data[i]);
        }
    }

    private void writeInts(int ptr, int[] data) {
        for (int i = 0; i < data.length; i++) {
            adderInterface.memory().setArrayElement(ptr + (i * Integer.BYTES), data[i]);
        }
    }

    private void write(int ptr, List<?> data, int size) {
        for (int i = 0; i < data.size(); i++) {
            adderInterface.memory().setArrayElement(ptr + (i * size), data.get(i));
        }
    }


    int allocate(int size) {
        return adderInterface.cabi_realloc(0, 0, 1, size);
    }

    private int allocate(int size, int alignment) {
        return adderInterface.cabi_realloc(0, 0, alignment, size);
    }

    private void free(int ptr) {
        adderInterface.cabi_realloc(ptr, 0, 1, 0);
    }

    private byte[] readBytes(int ptr, int len) {
        byte[] data = new byte[len];
        for (int i = 0; i < len; i++) {
            data[i] = (byte)adderInterface.memory().getArrayElement(ptr + i).asInt();
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
        free(stringPtr);

        return new String(stringBytes, StandardCharsets.UTF_8);
    }

    public int addInt(int x, int y) {
        int result = adderInterface.exports_docs_adder_simple_add_int(x, y);
        return result;
    }

    public float addFloat(float x, float y) {
        float result = adderInterface.exports_docs_adder_simple_add_float(x, y);
        return result;
    }

    public double addDouble(double x, double y) {
        double result = adderInterface.exports_docs_adder_simple_add_double(x, y);
        return result;
    }

    public Point addPoint(Point x, Point y) {
        // Lowering parameter 'x' to wasm memory
        int temp0 = allocate(16);
        ByteBuffer temp1 = ByteBuffer.allocate(16).order(ByteOrder.LITTLE_ENDIAN);
        temp1.putInt(x.x);
        temp1.putInt(x.y);
        temp1.putDouble(x.z);
        writeBytes(temp0, temp1.array());
        // Lowering parameter 'y' to wasm memory
        int temp2 = allocate(16);
        ByteBuffer temp3 = ByteBuffer.allocate(16).order(ByteOrder.LITTLE_ENDIAN);
        temp3.putInt(y.x);
        temp3.putInt(y.y);
        temp3.putDouble(y.z);
        writeBytes(temp2, temp3.array());
        int result_ptr = allocate(16);
        wasmModule.getMember("exports_docs_adder_simple_add_point").executeVoid(temp0, temp2, result_ptr);
        // Lifting result from wasm memory
        byte[] temp5 = readBytes(result_ptr, 16);
        ByteBuffer temp6 = ByteBuffer.wrap(temp5).order(ByteOrder.LITTLE_ENDIAN);
        Point temp4 = new Point(temp6.getInt(0), temp6.getInt(4), temp6.getDouble(8));
        free(temp2);
        free(temp0);

        return temp4;
    }

    public Point subPoint(Point x, Point y) {
        // Lowering parameter 'x' to wasm memory
        int temp0 = allocate(16);
        ByteBuffer temp1 = ByteBuffer.allocate(16).order(ByteOrder.LITTLE_ENDIAN);
        temp1.putInt(x.x);
        temp1.putInt(x.y);
        temp1.putDouble(x.z);
        writeBytes(temp0, temp1.array());
        // Lowering parameter 'y' to wasm memory
        int temp2 = allocate(16);
        ByteBuffer temp3 = ByteBuffer.allocate(16).order(ByteOrder.LITTLE_ENDIAN);
        temp3.putInt(y.x);
        temp3.putInt(y.y);
        temp3.putDouble(y.z);
        writeBytes(temp2, temp3.array());
        int result_ptr = allocate(16);
        wasmModule.getMember("exports_docs_adder_simple_sub_point").executeVoid(temp0, temp2, result_ptr);
        // Lifting result from wasm memory
        byte[] temp5 = readBytes(result_ptr, 16);
        ByteBuffer temp6 = ByteBuffer.wrap(temp5).order(ByteOrder.LITTLE_ENDIAN);
        Point temp4 = new Point(temp6.getInt(0), temp6.getInt(4), temp6.getDouble(8));
        free(temp2);
        free(temp0);

        return temp4;
    }

    public java.util.List<Point> scalePoints(java.util.List<Point> x, int scalar) {
        // Lowering parameter 'x' to wasm memory
        int temp0 = allocate(8, 4);
        int temp1 = allocate(x.size() * 16, 8);
        ByteBuffer temp2 = ByteBuffer.allocate(16).order(ByteOrder.LITTLE_ENDIAN);
        for (int temp3 = 0; temp3 < x.size(); temp3++) {
            Point temp4 = x.get(temp3);
            temp2.clear();
            temp2.putInt(temp4.x());
            temp2.putInt(temp4.y());
            temp2.putDouble(temp4.z());
            writeBytes(temp1 + temp3 * 16, temp2.array());
        }
        ByteBuffer temp5 = ByteBuffer.allocate(8).order(ByteOrder.LITTLE_ENDIAN);
        temp5.putInt(temp1).putInt(x.size());
        writeBytes(temp0, temp5.array());
        int result_ptr = allocate(8, 4);
        wasmModule.getMember("exports_docs_adder_simple_scale_points").executeVoid(temp0, scalar, result_ptr);
        // Lifting result from wasm memory
        byte[] temp7 = readBytes(result_ptr, 8);
        ByteBuffer temp8 = ByteBuffer.wrap(temp7).order(ByteOrder.LITTLE_ENDIAN);
        int temp9 = temp8.getInt(0);
        int temp10 = temp8.getInt(4);
        java.util.List<Point> temp6 = new java.util.ArrayList<>(temp10);
        for (int temp11 = 0; temp11 < temp10; temp11++) {
            byte[] temp13 = readBytes(temp9 + temp11 * 16, 16);
            ByteBuffer temp14 = ByteBuffer.wrap(temp13).order(ByteOrder.LITTLE_ENDIAN);
            int temp15 = temp14.getInt(0);
            int temp16 = temp14.getInt(4);
            double temp17 = temp14.getDouble(8);
            Point temp12 = new Point(temp15, temp16, temp17);
            temp6.add(temp12);
        }
        free(temp9); // Free the list content memory allocated by Wasm
        free(result_ptr);
        free(temp1);
        free(temp0);

        return temp6;

    }

    public String concat(String x, String y) {
        // Lowering parameter 'x' to wasm memory
        int temp0 = allocate(8, 4);
        byte[] temp1 = x.getBytes(StandardCharsets.UTF_8);
        int temp2 = allocate(temp1.length, 1);
        writeBytes(temp2, temp1);
        ByteBuffer temp3 = ByteBuffer.allocate(8).order(ByteOrder.LITTLE_ENDIAN);
        temp3.putInt(temp2).putInt(temp1.length);
        writeBytes(temp0, temp3.array());
        // Lowering parameter 'y' to wasm memory
        int temp4 = allocate(8, 4);
        byte[] temp5 = y.getBytes(StandardCharsets.UTF_8);
        int temp6 = allocate(temp5.length, 1);
        writeBytes(temp6, temp5);
        ByteBuffer temp7 = ByteBuffer.allocate(8).order(ByteOrder.LITTLE_ENDIAN);
        temp7.putInt(temp6).putInt(temp5.length);
        writeBytes(temp4, temp7.array());
        int result_ptr = allocate(8, 4);
        wasmModule.getMember("exports_docs_adder_simple_concat").executeVoid(temp0, temp4, result_ptr);
        // Lifting result from wasm memory
        byte[] temp9 = readBytes(result_ptr, 8);
        ByteBuffer temp10 = ByteBuffer.wrap(temp9).order(ByteOrder.LITTLE_ENDIAN);
        int temp11 = temp10.getInt(0);
        int temp12 = temp10.getInt(4);
        byte[] temp13 = readBytes(temp11, temp12);
        String temp8 = new String(temp13, StandardCharsets.UTF_8);
        free(temp11); // Free the string content memory allocated by Wasm
        free(result_ptr);
        free(temp6);
        free(temp4);
        free(temp2);
        free(temp0);

        return temp8;

    }

    public String reverse(String x) {
        // Lowering parameter 'x' to wasm memory
        int temp0 = allocate(8, 4);
        byte[] temp1 = x.getBytes(StandardCharsets.UTF_8);
        int temp2 = allocate(temp1.length, 1);
        writeBytes(temp2, temp1);
        ByteBuffer temp3 = ByteBuffer.allocate(8).order(ByteOrder.LITTLE_ENDIAN);
        temp3.putInt(temp2).putInt(temp1.length);
        writeBytes(temp0, temp3.array());
        int result_ptr = allocate(8, 4);
        wasmModule.getMember("exports_docs_adder_simple_reverse").executeVoid(temp0, result_ptr);
        // Lifting result from wasm memory
        byte[] temp5 = readBytes(result_ptr, 8);
        ByteBuffer temp6 = ByteBuffer.wrap(temp5).order(ByteOrder.LITTLE_ENDIAN);
        int temp7 = temp6.getInt(0);
        int temp8 = temp6.getInt(4);
        byte[] temp9 = readBytes(temp7, temp8);
        String temp4 = new String(temp9, StandardCharsets.UTF_8);
        free(temp7); // Free the string content memory allocated by Wasm
        free(result_ptr);
        free(temp2);
        free(temp0);

        return temp4;

    }


    public List<Float> getStatisticsInt(List<Integer> x) {
        // beginning of parsing argument x
        int x_count = x.size();
        int x_dataSize = x_count * SIZEOF_U32;
        int x_dataPtr = allocate(x_dataSize);
        write(x_dataPtr, x, SIZEOF_U32);
        int x_inListStruct = allocate(STRUCT_SIZE);
        ByteBuffer x_pointListBuffer = ByteBuffer.allocate(STRUCT_SIZE).order(ByteOrder.LITTLE_ENDIAN);
        x_pointListBuffer.putInt(x_dataPtr);
        x_pointListBuffer.putInt(x_count);
        writeBytes(x_inListStruct, x_pointListBuffer.array());
        int result_val = allocate(STRUCT_SIZE);
        wasmModule.getMember("exports_docs_adder_simple_get_statistics_int").executeVoid(x_inListStruct, result_val);
        byte[] out_struct_bytes = readBytes(result_val, STRUCT_SIZE);
        ByteBuffer outputListBuffer = ByteBuffer.wrap(out_struct_bytes).order(ByteOrder.LITTLE_ENDIAN);
        int outDataPtr = outputListBuffer.getInt(0);
        int outLen = outputListBuffer.getInt(4);
        byte[] resultBytes = readBytes(outDataPtr, outLen * STRUCT_SIZE);
        ByteBuffer resultBuffer = ByteBuffer.wrap(resultBytes).order(ByteOrder.LITTLE_ENDIAN);
        List<Float> result = new ArrayList<>(outLen);
        for (int i = 0; i < outLen; i++) {
            result.add(resultBuffer.getFloat());
        }

        free(x_dataPtr);
        free(x_inListStruct);
        free(result_val);
        free(outDataPtr);

        return result;
    }

    public java.util.List<Float> getStatisticsListInt(java.util.List<java.util.List<Integer>> x) {
        // Lowering parameter 'x' to wasm memory
        int temp0 = allocate(8);
        int temp1 = allocate(x.size() * 8);
        for (int temp2 = 0; temp2 < x.size(); temp2++) {
            java.util.List<Integer> temp3 = x.get(temp2);
            int temp4 = allocate(temp3.size() * 4);
            for (int temp5 = 0; temp5 < temp3.size(); temp5++) {
                Integer temp6 = temp3.get(temp5);
                ByteBuffer temp7 = ByteBuffer.allocate(4).order(ByteOrder.LITTLE_ENDIAN);
                temp7.putInt(temp6);
                writeBytes(temp4 + temp5 * 4, temp7.array());
            }
            // Store the pointer and length for the list
            ByteBuffer temp8 = ByteBuffer.allocate(8).order(ByteOrder.LITTLE_ENDIAN);
            temp8.putInt(temp4).putInt(temp3.size());
            writeBytes(temp1 + temp2 * 8, temp8.array());
            free(temp4);
        }
        // Store the pointer and length for the list
        ByteBuffer temp9 = ByteBuffer.allocate(8).order(ByteOrder.LITTLE_ENDIAN);
        temp9.putInt(temp1).putInt(x.size());
        writeBytes(temp0, temp9.array());
        int result_ptr = allocate(8);
        wasmModule.getMember("exports_docs_adder_simple_get_statistics_list_int").executeVoid(temp0, result_ptr);
        // Lifting result from wasm memory
        byte[] temp11 = readBytes(result_ptr, 8);
        ByteBuffer temp12 = ByteBuffer.wrap(temp11).order(ByteOrder.LITTLE_ENDIAN);
        int temp13 = temp12.getInt(0);
        int temp14 = temp12.getInt(4);
        java.util.List<Float> temp10 = new java.util.ArrayList<>(temp14);
        for (int temp15 = 0; temp15 < temp14; temp15++) {
            byte[] temp17 = readBytes(temp13 + temp15 * 4, 4);
            ByteBuffer temp18 = ByteBuffer.wrap(temp17).order(ByteOrder.LITTLE_ENDIAN);
            float temp16 = temp18.getFloat(0);
            temp10.add(temp16);
        }
        free(temp13); // Free the list content memory allocated by Wasm
        free(temp1);
        free(temp0);

        return temp10;
    }

    public java.util.List<Float> getStatisticsInt2(java.util.List<Integer> x) {
        // Lowering parameter 'x' to wasm memory
        int temp0 = allocate(8);
        int temp1 = allocate(x.size() * 4);
        for (int temp2 = 0; temp2 < x.size(); temp2++) {
            Integer temp3 = x.get(temp2);
            ByteBuffer temp4 = ByteBuffer.allocate(4).order(ByteOrder.LITTLE_ENDIAN);
            temp4.putInt(temp3);
            writeBytes(temp1 + temp2 * 4, temp4.array());
        }
        // Store the pointer and length for the list
        ByteBuffer temp5 = ByteBuffer.allocate(8).order(ByteOrder.LITTLE_ENDIAN);
        temp5.putInt(temp1).putInt(x.size());
        writeBytes(temp0, temp5.array());
        int result_ptr = allocate(8);
        wasmModule.getMember("exports_docs_adder_simple_get_statistics_int").executeVoid(temp0, result_ptr);
        // Lifting result from wasm memory
        byte[] temp7 = readBytes(result_ptr, 8);
        ByteBuffer temp8 = ByteBuffer.wrap(temp7).order(ByteOrder.LITTLE_ENDIAN);
        int temp9 = temp8.getInt(0);
        int temp10 = temp8.getInt(4);
        java.util.List<Float> temp6 = new java.util.ArrayList<>(temp10);
        for (int temp11 = 0; temp11 < temp10; temp11++) {
            byte[] temp13 = readBytes(temp9 + temp11 * 4, 4);
            ByteBuffer temp14 = ByteBuffer.wrap(temp13).order(ByteOrder.LITTLE_ENDIAN);
            float temp12 = temp14.getFloat(0);
            temp6.add(temp12);
        }
        free(temp9); // Free the list content memory allocated by Wasm
        free(temp1);
        free(temp0);

        return temp6;
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

    public List<Float> getStatistics(List<Integer> inputNumbers) {

        int count = inputNumbers.size();
        int dataSize = count * SIZEOF_U32;
        int dataPtr = allocate(dataSize);

        write(dataPtr, inputNumbers, SIZEOF_U32);

        int inListStruct = allocate(STRUCT_SIZE);
        ByteBuffer pointListBuffer = ByteBuffer.allocate(STRUCT_SIZE).order(ByteOrder.LITTLE_ENDIAN);
        pointListBuffer.putInt(dataPtr);
        pointListBuffer.putInt(count);
        writeBytes(inListStruct, pointListBuffer.array());

        int outListStruct = allocate(STRUCT_SIZE);
        adderInterface.exports_docs_adder_simple_get_statistics_int(inListStruct, outListStruct);
        byte[] outStructBytes = readBytes(outListStruct, STRUCT_SIZE);
        ByteBuffer outputListBuffer = ByteBuffer.wrap(outStructBytes).order(ByteOrder.LITTLE_ENDIAN);
        int outDataPtr = outputListBuffer.getInt(0);
        int outLen = outputListBuffer.getInt(4);

        byte[] resultBytes = readBytes(outDataPtr, outLen * SIZEOF_F32);
        ByteBuffer resultBuffer = ByteBuffer.wrap(resultBytes).order(ByteOrder.LITTLE_ENDIAN);

        List<Float> result = new ArrayList<>(outLen);
        for (int i = 0; i < outLen; i++) {
            result.add(resultBuffer.getFloat());
        }

        free(outDataPtr);
        free(outListStruct);
        free(inListStruct);
        free(dataPtr);

        return result;
    }
}
