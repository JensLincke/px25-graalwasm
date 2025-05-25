package org.example;

import com.oracle.truffle.api.CallTarget;
import org.graalvm.polyglot.Context;
import org.graalvm.polyglot.HostAccess;
import org.graalvm.polyglot.Source;
import org.graalvm.polyglot.Value;
import org.springframework.core.io.ClassPathResource;

import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

public class DirectWasm {
    public DirectWasm() {
        try (Context context = Context.newBuilder().allowHostAccess(HostAccess.ALL).allowAllAccess(true).build()) {
            URL wasmFile = new ClassPathResource("adder.wasm").getURL();
            String moduleName = "main";
            var envModuleWAT = new File("/home/lorik/MasterPotsdam/SoSe25/px/px25-graalwasm/graalwasm/graalwasm-inspector/src/main/resources/env.wat");
            context.eval(Source.newBuilder("wasm", envModuleWAT).name("env").build());
            context.eval(Source.newBuilder("wasm",
                            new File("/opt/wasi-sdk/share/wasi-sysroot/lib/wasm32-wasi/wasi_snapshot_preview1.wasm"))
                    .name("wasi_snapshot_preview1")
                    .build());

            context.eval(Source.newBuilder("wasm", wasmFile).name(moduleName).build());
            wasmModule = context.getBindings("wasm").getMember(moduleName);

            Value addInt = wasmModule
                    .getMember("exports")
                    .getMember("add-int");
            var intadd = wasmModule.getMember("add-int").execute(3,4).asInt();
            var floatadd = wasmModule.getMember("add-str").execute(3,4).asFloat();
            var doubleadd = wasmModule.getMember("add-double").execute(3,4).asDouble();

            printMetaData();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    List<CallTarget> callTargets = new ArrayList<>();

    private void printMetaData() {
        var keys = wasmModule.getMemberKeys();
        for (String key : keys) {
            var currentValue = wasmModule.getMember(key);
            System.out.println(key + ": " + wasmModule.getMember(key));
        }
    }

    private final Value wasmModule;

    public int add(int a, int b) {
        return wasmModule.getMember("add").execute(a,b).asInt();
    }
}
