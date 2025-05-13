package org.example;

import com.oracle.truffle.api.CallTarget;
import org.graalvm.polyglot.Context;
import org.graalvm.polyglot.Source;
import org.graalvm.polyglot.Value;
import org.springframework.core.io.ClassPathResource;

import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

public class DirectWasm implements WasmCommand {
    public DirectWasm() {
        try (Context context = Context.create()) {
            URL wasmFile = new ClassPathResource("wasm_cpp.wasm").getURL();
            String moduleName = "main";
            context.eval(Source.newBuilder("wasm", wasmFile).name(moduleName).build());
            wasmModule = context.getBindings("wasm").getMember(moduleName);
            printMetaData();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    List<CallTarget> callTargets = new ArrayList<>();

    private void printMetaData() {
        var keys = wasmModule.getMemberKeys();
        // exports are listed below!
        for (String key : keys) {
            System.out.println(key + ": " + wasmModule.getMember(key));
        }
    }



    private final Value wasmModule;

    @Override
    public int add(int a, int b) {
        return wasmModule.getMember("add").execute(a,b).asInt();
    }

    @Override
    public List<String> listExports() {
        return null;
    }
}
