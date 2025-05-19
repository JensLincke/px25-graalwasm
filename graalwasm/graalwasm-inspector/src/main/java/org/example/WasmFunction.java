package org.example;

import org.graalvm.wasm.api.ValueType;
import java.util.List;

public class WasmFunction {

    public WasmFunction(String functionName, List<ValueType> returnTypes, List<ValueType> parameterTypes) {
        _functionName = functionName;
        _returnTypes = returnTypes;
        _parameterTypes = parameterTypes;
    }

    public void print() {
        System.out.println("Function name: " + _functionName);
        for (ValueType paramType : _parameterTypes) {
            System.out.println("param: " + paramType);
        }
        for (ValueType returnType : _returnTypes) {
            System.out.println("return: " + returnType);
        }
    }

    private String _functionName;
    private List<ValueType> _returnTypes;
    private List<ValueType> _parameterTypes;

}
