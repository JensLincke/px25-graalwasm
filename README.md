# px25-graalwasm

This github repo contains the poject "Generating Java Interfaces for Wasm" as part of the Programming Experience Course at HPI. 

## Contents

Currently there are two smaller projects in this repo. 

[wit-to-java](wit-to-java) is a rust based code generator which takes as input a WIT file and generates java boilerplate code for it. At the moment it implements the following subset of the Canonical ABI (Lists, Records, Strings). 

[wit-introduction](wit-introduction) is a cpp project that compiles to a wasm module using the wasi-core SDK. It is supposed to provide a brief introduction on how to create a wasm module that is compliant to the WebAssembly Component model. It contains a wit file, its implementation and some documentation on how to build the module.

[graalwasm-inspector](graalwasm) is a java project which makes use of the wasm module generated from wit-introduction. It also uses the outputted file from the wit-to-java generator. 