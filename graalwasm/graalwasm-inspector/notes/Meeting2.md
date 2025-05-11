## Regarding the js wrapper file.

1. Strip everything that is not absolutely necessary! - done, now the js file is minimal.
2. It would be good to generate all this boilerplate code for java.
3. Maybe we can just skip all the js. Figure out what WebAssembly.instantiate is making possible.
4. Look if we can call webassembly directly?
5. Look whether there is something callable (call target) in WebAssembly - need to learn more about this.

## WebAssembly.Instantiate

### Compilation

WebAssembly.instantiate(...) compiles and instantiates a WebAssembly module, making its exports (i.e., functions, memory, tables, globals) available for use in JavaScript.

It contains two steps: 

```js
// compile + instantiate
const module = await WebAssembly.compile(bytes);
const instance = await WebAssembly.instantiate(module, imports);

// This transforms raw .wasm bytes into a live WebAssembly instance you can call from JS.
```

The compilation step will translate the raw .wasm binary (WebAssembly bytecode) into machine code that the browser or runtime (GraalVM) can execute natively.

### Import Link

It connects the Wasm module's import requirements (e.g. functions from JS, memory) to JavaScript functions or values you provide. In case the wasm module contains external dependencies, the import link stage should resolve them.

### Expose exported functions

Once instantiated, you can call exported Wasm functions directly from JS like regular functions. In our case this becomes:

```js
    const { instance } = await WebAssembly.instantiate(source, {});
    wasm = instance.exports;
    var res = wasm.add(3,4);
```

### Expose memory access

If the Wasm module exports memory, you can manipulate it from JavaScript:

```js
const memory = instance.exports.memory;
const mem = new Uint8Array(memory.buffer);
mem[0] = 42;
```