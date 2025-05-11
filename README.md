# px25-graalwasm

This github repo contains the poject "Generating Java Interfaces for Wasm" as part of the Programming Experience Course at HPI. 

## Contents

Currently there are two smaller projects in this repo. 

[wasm-cpp](wasm-cpp) is a cpp project that compiles to a wasm module using the emscripten toolchain. It contains a simple addition function to demonstrate the usage of a wasm module from a java or javascript runtime.

[graalwasm-inspector](graalwasm) is a java project which makes use of the wasm module generated from wasm-cpp. 