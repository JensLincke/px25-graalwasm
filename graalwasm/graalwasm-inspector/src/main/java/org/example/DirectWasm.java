package org.example;

import org.graalvm.polyglot.Context;
import org.graalvm.polyglot.Source;
import org.graalvm.polyglot.Value;
import org.springframework.core.io.ClassPathResource;

import java.io.IOException;
import java.net.URL;

public class DirectWasm {
    DirectWasm() {
        try (Context context = Context.create()) {
            URL wasmFile = new ClassPathResource("add.wasm").getURL();
            String moduleName = "main";
            context.eval(Source.newBuilder("wasm", wasmFile).name(moduleName).build());
            Value addTwo = context.getBindings("wasm").getMember(moduleName).getMember("add");
            System.out.println("addTwo(40, 2) = " + addTwo.execute(40, 2));
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
