let wasm;

// strip everything that is not absolutely necessary!
// it would be good to generate all this boilerplate code for java.
// maybe we can just skip all the js. Figure out what WebAssembly.instantiate is making possible.
// look if we can call webassembly directly?
// look whether there is something callable (call target) in WebAssembly
// do it without javascript

/**
 * Adds two numbers using the WebAssembly module.
 * @param {number} a
 * @param {number} b
 * @returns {number}
 */
export function add(a, b) {
    return wasm.add(a, b);
}

/**
 * Default export: Initializes the WebAssembly module.
 * Called from Java using invokeMember("default", wasmContent)
 * @param {WebAssembly.Module | Response | ArrayBuffer | Promise<Response>} moduleOrResponse
 * @returns {Promise<any>}
 */
export default async function init(moduleOrResponse) {
    // If it's a Response or Promise, resolve and compile it
    const source = moduleOrResponse instanceof WebAssembly.Module
        ? moduleOrResponse
        : await moduleOrResponse;

    const { instance } = await WebAssembly.instantiate(source, {});
    wasm = instance.exports;

    // Optionally call __wbindgen_start if it's part of the module
    if (wasm.__wbindgen_start) {
        wasm.__wbindgen_start();
    }

    return wasm;
}