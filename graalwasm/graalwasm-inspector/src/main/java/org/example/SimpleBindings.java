package org.example;

import org.graalvm.polyglot.*;
import org.graalvm.polyglot.io.ByteSequence;
import java.io.IOException;
import java.net.URL;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.charset.StandardCharsets;
import java.util.List;

public class SimpleBindings {

    public record Point(int x, int y, double z) {
        @Override
        public boolean equals(Object obj) {
            if (obj == null) return false;
            if (obj.getClass() != this.getClass()) return false;
            Point other = (Point) obj;
            if (this.x != other.x) return false;
            if (this.y != other.y) return false;
            if (this.z != other.z) return false;
            return true;
        }
    }

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

    public Point addPoint(Point x, Point y) {
        // Lowering parameter 'x' to wasm memory
        int temp0 = allocate(16, 8);
        ByteBuffer temp1 = ByteBuffer.allocate(16).order(ByteOrder.LITTLE_ENDIAN);
        temp1.putInt(0, x.x());
        temp1.putInt(4, x.y());
        temp1.putDouble(8, x.z());
        writeBytes(temp0, temp1.array());
        // Lowering parameter 'y' to wasm memory
        int temp2 = allocate(16, 8);
        ByteBuffer temp3 = ByteBuffer.allocate(16).order(ByteOrder.LITTLE_ENDIAN);
        temp3.putInt(0, y.x());
        temp3.putInt(4, y.y());
        temp3.putDouble(8, y.z());
        writeBytes(temp2, temp3.array());
        int result_ptr = allocate(16, 8);
        wasmModule.getMember("exports_docs_adder_simple_add_point").executeVoid(temp0, temp2, result_ptr);
        // Lifting result from wasm memory
        byte[] temp5 = readBytes(result_ptr, 16);
        ByteBuffer temp6 = ByteBuffer.wrap(temp5).order(ByteOrder.LITTLE_ENDIAN);
        int temp7 = temp6.getInt(0);
        int temp8 = temp6.getInt(4);
        double temp9 = temp6.getDouble(8);
        Point temp4 = new Point(temp7, temp8, temp9);
        free(result_ptr);
        free(temp2);
        free(temp0);

        return temp4;

    }

    public Point subPoint(Point x, Point y) {
        // Lowering parameter 'x' to wasm memory
        int temp0 = allocate(16, 8);
        ByteBuffer temp1 = ByteBuffer.allocate(16).order(ByteOrder.LITTLE_ENDIAN);
        temp1.putInt(0, x.x());
        temp1.putInt(4, x.y());
        temp1.putDouble(8, x.z());
        writeBytes(temp0, temp1.array());
        // Lowering parameter 'y' to wasm memory
        int temp2 = allocate(16, 8);
        ByteBuffer temp3 = ByteBuffer.allocate(16).order(ByteOrder.LITTLE_ENDIAN);
        temp3.putInt(0, y.x());
        temp3.putInt(4, y.y());
        temp3.putDouble(8, y.z());
        writeBytes(temp2, temp3.array());
        int result_ptr = allocate(16, 8);
        wasmModule.getMember("exports_docs_adder_simple_sub_point").executeVoid(temp0, temp2, result_ptr);
        // Lifting result from wasm memory
        byte[] temp5 = readBytes(result_ptr, 16);
        ByteBuffer temp6 = ByteBuffer.wrap(temp5).order(ByteOrder.LITTLE_ENDIAN);
        int temp7 = temp6.getInt(0);
        int temp8 = temp6.getInt(4);
        double temp9 = temp6.getDouble(8);
        Point temp4 = new Point(temp7, temp8, temp9);
        free(result_ptr);
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
        free(temp9);        free(result_ptr);
        free(temp1);
        free(temp0);

        return temp6;

    }

    public java.util.List<Float> getStatisticsInt(java.util.List<Integer> x) {
        // Lowering parameter 'x' to wasm memory
        int temp0 = allocate(8, 4);
        int temp1 = allocate(x.size() * 4, 4);
        for (int temp3 = 0; temp3 < x.size(); temp3++) {
            Integer temp4 = x.get(temp3);
            ByteBuffer temp5 = ByteBuffer.allocate(4).order(ByteOrder.LITTLE_ENDIAN);
            temp5.putInt(temp4);
            writeBytes(temp1 + temp3 * 4, temp5.array());
        }
        ByteBuffer temp6 = ByteBuffer.allocate(8).order(ByteOrder.LITTLE_ENDIAN);
        temp6.putInt(temp1).putInt(x.size());
        writeBytes(temp0, temp6.array());
        int result_ptr = allocate(8, 4);
        wasmModule.getMember("exports_docs_adder_simple_get_statistics_int").executeVoid(temp0, result_ptr);
        // Lifting result from wasm memory
        byte[] temp8 = readBytes(result_ptr, 8);
        ByteBuffer temp9 = ByteBuffer.wrap(temp8).order(ByteOrder.LITTLE_ENDIAN);
        int temp10 = temp9.getInt(0);
        int temp11 = temp9.getInt(4);
        java.util.List<Float> temp7 = new java.util.ArrayList<>(temp11);
        for (int temp12 = 0; temp12 < temp11; temp12++) {
            byte[] temp14 = readBytes(temp10 + temp12 * 4, 4);
            ByteBuffer temp15 = ByteBuffer.wrap(temp14).order(ByteOrder.LITTLE_ENDIAN);
            float temp13 = temp15.getFloat(0);
            temp7.add(temp13);
        }
        free(temp10);        free(result_ptr);
        free(temp1);
        free(temp0);

        return temp7;

    }
}
