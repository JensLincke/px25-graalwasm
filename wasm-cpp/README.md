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