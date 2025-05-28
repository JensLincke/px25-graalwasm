package org.example;

import org.graalvm.polyglot.Value;

import java.nio.ByteBuffer;
import java.nio.ByteOrder;

public class WasmBridge {
    private final P1Loader loader;

    public WasmBridge(P1Loader loader) {
        this.loader = loader;
    }

    public String reverse(String s) {

        return s;
    }
}
