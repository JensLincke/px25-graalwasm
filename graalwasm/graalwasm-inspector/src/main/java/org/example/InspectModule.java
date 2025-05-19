package org.example;

import com.oracle.truffle.api.interop.*;
import org.graalvm.polyglot.*;
import org.graalvm.polyglot.io.ByteSequence;
import org.graalvm.wasm.*;
import org.graalvm.wasm.api.ValueType;
import org.graalvm.wasm.api.WebAssembly;
import org.graalvm.wasm.predefined.testutil.TestutilModule;
import org.springframework.core.io.ClassPathResource;

import java.io.IOException;
import java.util.ArrayList;
import java.util.function.Consumer;

public class InspectModule {

    public static void runTest(Consumer<Context.Builder> options, Consumer<WasmContext> testCase, byte[] binaryWithExports) throws IOException {
        final Context.Builder contextBuilder = Context.newBuilder(WasmLanguage.ID);
        contextBuilder.option("wasm.Builtins", "testutil:testutil"); // preloading the testuil
        if (options != null) {
            options.accept(contextBuilder);
        }
        try (Context context = contextBuilder.build()) {
            Source.Builder sourceBuilder = Source.newBuilder(WasmLanguage.ID, ByteSequence.create(binaryWithExports), "main");
            Source source = sourceBuilder.build();
            context.eval(source);
            // up to here we have no access to the guest heap, symbol table or import/export descriptors.
            // TestutilModule.Names.RUN_CUSTOM_INITIALIZATION seems to do some magic that enables access later on
            // I am assuming this is also building the WasmContext
            // TODO(lorik) take a look:  seems like implementation details are: org.graalvm.wasm.predefined.testutil
            // what would be the benefit of implementing the testutil myself?
            Value run = context.getBindings(WasmLanguage.ID).getMember("testutil").getMember(TestutilModule.Names.RUN_CUSTOM_INITIALIZATION);
            run.execute(new GuestCode(testCase));
        }
    }

    public static void runTest(Consumer<WasmContext> testCase, byte[] binaryWithExports) throws IOException {
        runTest(null, testCase, binaryWithExports);
    }

    // first time I see a consumer pattern in java but this seems to be some sort of callback that is invoked
    // from the testutil, and it is handing the WasmContext to the callback.
    // it seems like this implements the TruffleObject interface because it needs to be callable from the guest
    private static final class GuestCode implements Consumer<WasmContext>, TruffleObject {
        private final Consumer<WasmContext> context;

        private GuestCode(Consumer<WasmContext> testCase) {
            this.context = testCase;
        }

        @Override
        public void accept(WasmContext context) {
            this.context.accept(context);
        }
    }

    public static WasmInstance moduleInstantiate(WebAssembly wasm, byte[] source, Object importObject) {
        final WasmModule module = wasm.moduleDecode(source);
        return wasm.moduleInstantiate(module, importObject);
    }

    public void testInstantiateWithExportTable(byte[] binaryWithExports) throws IOException {
        runTest(context -> {
            final WebAssembly wasm = new WebAssembly(context);
            final WasmInstance instance = moduleInstantiate(wasm, binaryWithExports, null);

            ArrayList<WasmFunction> wasmStuff = new ArrayList<>();

            var symbolTable = instance.symbolTable();
            for (int i = 0; i < symbolTable.numFunctions(); i++)
            {
                var paramTypes = new ArrayList<ValueType>();
                var resultTypes = new ArrayList<ValueType>();
                var func = symbolTable.function(i);
                var param_count = func.paramCount();
                var result_count = func.resultCount();
                for (int j = 0; j < param_count; j++){
                    paramTypes.add(ValueType.fromByteValue(func.paramTypeAt(j)));
                }
                for (int j = 0; j < result_count; j++){
                    resultTypes.add(ValueType.fromByteValue(func.resultTypeAt(j)));
                }
                var functionParsed = new WasmFunction(func.name(), resultTypes, paramTypes);
                functionParsed.print();
                wasmStuff.add(functionParsed);

            }
        }, binaryWithExports);
    }

    public InspectModule() throws IOException {
        var aa = new ClassPathResource("wasm_cpp.wasm").getInputStream().readAllBytes();
        testInstantiateWithExportTable(aa);
    }
}
