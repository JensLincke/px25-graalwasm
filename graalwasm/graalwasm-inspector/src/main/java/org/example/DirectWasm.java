package org.example;

import org.graalvm.polyglot.Context;
import org.graalvm.polyglot.Source;
import org.graalvm.polyglot.Value;
import org.springframework.core.io.ClassPathResource;

import java.io.IOException;
import java.net.URL;

public class DirectWasm implements WasmCommand {
    DirectWasm() {
        try (Context context = Context.create()) {
            URL wasmFile = new ClassPathResource("add.wasm").getURL();
            String moduleName = "main";
            context.eval(Source.newBuilder("wasm", wasmFile).name(moduleName).build());
            wasmModule = context.getBindings("wasm").getMember(moduleName);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private final Value wasmModule;

    @Override
    public int add(int a, int b) {
        return wasmModule.getMember("add").execute(a,b).asInt();
    }
}
