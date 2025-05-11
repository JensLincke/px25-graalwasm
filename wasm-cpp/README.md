# Wasm-cpp

This cpp project aims to create a library which can be compiled to a wasm module. 

## Dependencies

Emscripten - you will need the emscripten toolchain to build a wasm module. You will need to clone the sdk once. But one has to always source 
the emsdk_env script to export the environment variables that are needed by CMake. 

```bash
git clone https://github.com/emscripten-core/emsdk.git
cd emsdk
./emsdk install latest
./emsdk activate latest
source ./emsdk_env.sh
```

You can also simply install `emscripten` using `sudo apt install emscripten`. After that you can build using

## Building

```bash
mkdir build && cd build
emcmake cmake ..
make all -j9
```

## Generating wat files

A .wat (WebAssembly Text format) file is the human-readable representation of a WebAssembly (.wasm) binary module. It provides a textual format for developers to read, inspect, or debug the internals of a Wasm module more easily.

To generate a .wat file from the .wasm file, we can use the following tool: https://manpages.ubuntu.com/manpages/focal/man1/wasm2wat.1.html 

```bash
wasm2wat build/wasm_cpp.wasm -o wasm_cpp.wat
```