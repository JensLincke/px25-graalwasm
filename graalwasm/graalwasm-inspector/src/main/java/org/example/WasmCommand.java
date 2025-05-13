package org.example;

import java.util.List;

public interface WasmCommand {
    int add(int a, int b);
    List<String> listExports();
}
