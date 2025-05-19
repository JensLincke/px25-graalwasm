package org.example;
import org.graalvm.polyglot.Context;
import org.graalvm.polyglot.HostAccess;
import org.graalvm.polyglot.Source;
import org.graalvm.polyglot.Value;
import org.springframework.core.io.ClassPathResource;

import java.io.IOException;
import java.net.URL;

public class DirectWasm {
    public DirectWasm() {
        try (Context context = Context.newBuilder().allowHostAccess(HostAccess.ALL).build()) {
            URL wasmFile = new ClassPathResource("wasm_cpp.wasm").getURL();
            String moduleName = "main";
            context.eval(Source.newBuilder("wasm", wasmFile).name(moduleName).build());
            wasmModule = context.getBindings("wasm").getMember(moduleName);

            printMetaData();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void printMetaData() {
        var keys = wasmModule.getMemberKeys();
        for (String key : keys) {
            var currentValue = wasmModule.getMember(key);
            System.out.println(key + ": " + wasmModule.getMember(key));
        }
    }

    private final Value wasmModule;
}
