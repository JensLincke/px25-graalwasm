package org.example;

import org.graalvm.polyglot.Context;
import org.graalvm.polyglot.Engine;
import org.graalvm.polyglot.Source;
import org.graalvm.polyglot.Value;
import org.springframework.core.io.ClassPathResource;

import java.io.IOException;

public class JsInstance {

    JsInstance() throws IOException {
        var add_js = getClass()
                .getClassLoader()
                .getResource("add.js");
        assert add_js != null;
        var aba = new ClassPathResource("add.js").getURL();
        Source addSource = Source.newBuilder("js", aba).mimeType("application/javascript+module").build();
        byte[] addWasmBytes = new ClassPathResource("add.wasm").getContentAsByteArray();
        Engine sharedEngine = Engine.create();

        createJSInstance(sharedEngine, addSource, addWasmBytes);
    }

    void createJSInstance(Engine engine, Source photonSource, byte[] wasmBytes)
    {
        Context context = Context.newBuilder("js", "wasm")
                .engine(engine)
                .allowAllAccess(true)
                .allowExperimentalOptions(true)
                .option("js.webassembly", "true")
                .option("js.esm-eval-returns-exports", "true")
                .build();

        // Get Uint8Array class from JavaScript
        Value uint8Array = context.eval("js", "Uint8Array");
        // Load Photon module and initialize with wasm content
        Value photonModule = context.eval(photonSource);
        // Create Uint8Array with wasm bytes
        Value wasmContent = uint8Array.newInstance(wasmBytes);
        // Initialize Photon module with wasm content
        photonModule.invokeMember("default", wasmContent);
        var aa = photonModule.hasMember("listWasmExports");
        var ks = photonModule.getMemberKeys();
        var res = photonModule.invokeMember("add", 3,4).asInt();

        System.out.println("Result from js: " + res);
        var str = "123;";
    }
}
