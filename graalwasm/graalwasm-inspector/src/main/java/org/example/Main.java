package org.example;

public class Main {
    public static void main(String[] args) throws Exception {
        var p1loader = new P1Loader();
        String fir = "hello";
        String sec = "olleh";
        String res = p1loader.reverse(fir);
        System.out.println(res);
        String conc = p1loader.concat(fir, sec);
        System.out.println("Concat: " + conc);
    }
}