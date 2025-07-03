package org.example;

import org.graalvm.polyglot.Context;
import org.graalvm.polyglot.HostAccess;
import org.graalvm.polyglot.Source;
import org.graalvm.polyglot.io.ByteSequence;
import org.springframework.core.io.ClassPathResource;

import java.io.IOException;
import java.util.List;

public class Main {

    private void _p1Loader() throws IOException {
        var p1loader = new P1Loader();
        String fir = "hello";
        String sec = "world12345";
        String res = p1loader.reverse(fir);
        System.out.println(res);
        String conc = p1loader.concat(fir, sec);
        System.out.println("Concat: " + conc);

        P1Loader.Point[] inputPoints = new P1Loader.Point[3];
        inputPoints[0] = new P1Loader.Point(0, 0);
        inputPoints[1] = new P1Loader.Point(1, 0);
        inputPoints[2] = new P1Loader.Point(2, 0);

        var scaledPoints = p1loader.scalePoints(inputPoints, 5);
        for (var point : scaledPoints) {
            System.out.println(point);
        }
    }

    public static void main(String[] args) throws Exception {
        try (Context context = Context.newBuilder("wasm").allowHostAccess(HostAccess.ALL)
                .option("wasm.Builtins", "wasi_snapshot_preview1").build()) {

            var wasmResource = new ClassPathResource("adder2.wasm").getURL();
            byte[] wasmBytes = wasmResource.openStream().readAllBytes();
            Source source = Source.newBuilder("wasm", ByteSequence.create(wasmBytes), "main").build();
            context.eval(source);

            var simpleBinding = new SimpleBindings(wasmResource, context);
            System.out.println(simpleBinding.addInt(2,3));
            System.out.println(simpleBinding.addFloat(3,4));
            System.out.println(simpleBinding.addDouble(4,5));

            String fir = "hello";
            String sec = "world12345";
            String res = simpleBinding.reverse(fir);
            System.out.println(res);
            List<Integer> myNumbers = List.of(10, 20, 30, 40, 50);
            var statistics = simpleBinding.getStatisticsInt2(myNumbers);
            System.out.println("sum: " + statistics.get(0));
            System.out.println("average: " + statistics.get(1));
            System.out.println("min: " + statistics.get(2));

            SimpleBindings.Point[] inputPoints = new SimpleBindings.Point[3];
            inputPoints[0] = new SimpleBindings.Point(0, 0, 1);
            inputPoints[1] = new SimpleBindings.Point(1, 2, 3.0);
            inputPoints[2] = new SimpleBindings.Point(3, 5, 8);

            var scaledPoints = simpleBinding.scalePoints(List.of(inputPoints), 5);
            for (var point : scaledPoints) {
                System.out.println("point: " + point);
            }
        }
    }
}