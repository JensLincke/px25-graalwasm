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
 * @param {Uint8Array} wasmBytes
 * @returns {Promise<any>}
 */
export default async function init(wasmBytes) {
    const { instance } = await WebAssembly.instantiate(wasmBytes, {});
    wasm = instance.exports;

    return wasm;
}

/**
 * Returns the exported keys from the loaded WebAssembly module.
 * @returns {string[]} Array of export names
 */
export function listExports() {
    if (!wasm) {
        throw new Error("WASM module not initialized. Call the default init function first.");
    }
    return Object.keys(wasm);
}