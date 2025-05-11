package org.example;

import java.io.IOException;

public class Main {
    public static void main(String[] args) throws IOException {
        System.out.printf("Hello and welcome!");
        var js = new JsInstance();
        var dir = new DirectWasm();
        assert(js.add(3,4) == dir.add(3,4));
    }
}