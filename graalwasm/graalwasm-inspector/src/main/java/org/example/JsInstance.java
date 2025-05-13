package org.example;

import org.graalvm.polyglot.Context;
import org.graalvm.polyglot.Engine;
import org.graalvm.polyglot.Source;
import org.graalvm.polyglot.Value;
import org.springframework.core.io.ClassPathResource;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class JsInstance implements WasmCommand {

    public JsInstance() throws IOException {
        var add_js = getClass()
                .getClassLoader()
                .getResource("add.js");
        assert add_js != null;
        var aba = new ClassPathResource("add.js").getURL();
        Source addSource = Source.newBuilder("js", aba).mimeType("application/javascript+module").build();
        byte[] addWasmBytes = new ClassPathResource("wasm_cpp.wasm").getContentAsByteArray();
        Engine sharedEngine = Engine.create();

        createJSInstance(sharedEngine, addSource, addWasmBytes);
    }

    void createJSInstance(Engine engine, Source jsSource, byte[] wasmBytes)
    {
        Context context = Context.newBuilder("js", "wasm")
                .engine(engine)
                .allowAllAccess(true)
                .allowExperimentalOptions(true)
                .option("js.webassembly", "true")
                .option("js.esm-eval-returns-exports", "true")
                .build();

        Value uint8Array = context.eval("js", "Uint8Array");
        wasmModule = context.eval(jsSource);
        Value wasmContent = uint8Array.newInstance(wasmBytes);
        wasmModule.invokeMember("default", wasmContent);
    }

    private Value wasmModule;

    @Override
    public int add(int a, int b) {
        return wasmModule.invokeMember("add", a, b).asInt();
    }

    @Override
    public List<String> listExports() {
        Value smth = wasmModule.invokeMember("listExports");
        List<String> exportNames = new ArrayList<>();
        for (int i = 0; i < smth.getArraySize(); i++) {
            exportNames.add(smth.getArrayElement(i).asString());
        }
        return exportNames;
    }
}
