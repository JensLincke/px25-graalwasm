let wasm;

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

    return wasm;
}