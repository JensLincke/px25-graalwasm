package org.example;
import org.graalvm.polyglot.Context;
import org.graalvm.polyglot.HostAccess;
import org.graalvm.polyglot.Source;
import org.graalvm.polyglot.Value;
import org.graalvm.polyglot.io.ByteSequence;
import org.springframework.core.io.ClassPathResource;

import java.io.IOException;
import java.net.URL;

public class DirectWasm {
    public DirectWasm() {
        try (Context context = Context.newBuilder("wasm")
                .allowHostAccess(HostAccess.ALL)
                .allowHostClassLookup(className ->
                        className.startsWith("org.graalvm.wasm.runtime") ||
                                className.startsWith("org.graalvm.truffle"))
                .build()) {

            String moduleName = "main";
            Source src = Source.newBuilder("wasm",
                            ByteSequence.create(new ClassPathResource("wasm_cpp.wasm").getInputStream().readAllBytes()),
                            moduleName)
                    .build();
            Value moduleVal = context.eval(src);
            // this doesnt work for some reason. Cant figure out why.
            Module module = moduleVal.asHostObject();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
