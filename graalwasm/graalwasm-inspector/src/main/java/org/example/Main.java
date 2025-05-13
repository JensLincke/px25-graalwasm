package org.example;

import java.io.IOException;

public class Main {
    public static void main(String[] args) throws IOException {
        var js = new JsInstance();
        var dir = new DirectWasm();
/*        var dir = new DirectWasm();
        assert(js.add(3,4) == dir.add(3,4));
        var aa = dir.listExports();
        var bb = js.listExports();*/
        var bb = js.listExports();
        System.out.println(js.listExports());
        //System.out.println(dir.listExports());
    }
}