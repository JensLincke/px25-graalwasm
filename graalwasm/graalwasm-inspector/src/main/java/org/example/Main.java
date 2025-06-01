package org.example;

public class Main {
    public static void main(String[] args) throws Exception {
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
}