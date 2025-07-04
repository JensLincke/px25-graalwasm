package org.example;

import org.graalvm.polyglot.Context;
import org.graalvm.polyglot.HostAccess;

import java.util.List;
import java.util.Objects;

public class Main {

    private static void testPrimitiveOperations(SimpleBindings simpleBinding) {
        assert 5 == simpleBinding.addInt(2, 3);
        assert 6.0 == simpleBinding.addFloat(2, 4);
        assert 9.0 == simpleBinding.addDouble(4, 5);
    }

    private static void testStringOperation(SimpleBindings simpleBinding) {
        String fir = "hello";
        String sec = "world12345";

        String reversed = simpleBinding.reverse(fir);
        assert "olleh".equals(reversed);

        String concat = simpleBinding.concat(fir, sec);
        assert concat.equals("helloworld12345");
    }

    private static void testGetListStatistics(SimpleBindings simpleBinding) {
        List<Integer> myNumbers = List.of(10, 20, 30, 40, 50);
        var statistics = simpleBinding.getStatisticsInt(myNumbers);
        assert statistics.get(0) == 150;
        assert statistics.get(1) == 30;
        assert statistics.get(2) == 10;
    }

    private static void testScaleListOfRecord(SimpleBindings simpleBinding) {
        var scaledPoints = simpleBinding.scalePoints(
                List.of(new SimpleBindings.Point(0, 0, 1),
                        new SimpleBindings.Point(1, 2, 3.0),
                        new SimpleBindings.Point(3, 5, 8)),
                5);

        assert scaledPoints.get(0).equals(new SimpleBindings.Point(0, 0, 6.0));
        assert scaledPoints.get(1).equals(new SimpleBindings.Point(5, 10, 15.0));
        assert scaledPoints.get(2).equals(new SimpleBindings.Point(15, 25, 40.0));
    }

    public static void main(String[] args) throws Exception {
        try (Context context = Context.newBuilder("wasm")
                .allowHostAccess(HostAccess.ALL)
                .option("wasm.Builtins", "wasi_snapshot_preview1").build()) {

            var wasmRes = Main.class.getResource("/adder2.wasm");
            assert wasmRes != null;

            var simpleBinding = new SimpleBindings(wasmRes, context);

            testPrimitiveOperations(simpleBinding);
            testStringOperation(simpleBinding);
            testGetListStatistics(simpleBinding);
            testScaleListOfRecord(simpleBinding);

            SimpleBindings.Point firstPoint = new SimpleBindings.Point(30, 20, 60.0);
            SimpleBindings.Point secondPoint = new SimpleBindings.Point(10, 8, 20.0);
            System.out.println("Subtracting point structs: " + simpleBinding.subPoint(firstPoint, secondPoint));
            System.out.println("Adding point structs: " + simpleBinding.addPoint(firstPoint, secondPoint));

        }
    }
}