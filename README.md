# px25-graalwasm

This github repo contains the poject "Generating Java Interfaces for Wasm" as part of the Programming Experience Course at HPI. 



## Project: Generating Java Interfaces for Wasm

### Abstract

This project, "Generating Java Interfaces for Wasm," explores the use of WebAssembly (Wasm) and the WebAssembly Component Model to facilitate interoperability between different programming languages, with a specific focus on generating Java interfaces from a Wasm module. The project is divided into three main components: `wit-to-java`, a Rust-based code generator; `wit-introduction`, a C++ project that compiles to a Wasm module; and `graalwasm-inspector`, a Java project that demonstrates how to use the generated Java interfaces to interact with the Wasm module.



### Introduction

WebAssembly (Wasm) is a binary instruction format for a stack-based virtual machine. It is designed as a portable target for the compilation of high-level languages like C++, C#, and Rust, enabling deployment on the web for client and server applications. While Wasm provides a powerful way to run code in a sandboxed environment, it has historically been limited to a small set of primitive types, such as integers and floats. This limitation makes it challenging to pass complex data structures between the host and the Wasm module, often requiring manual serialization and deserialization.

The WebAssembly Component Model is a proposal that aims to address this challenge by providing a standardized way to define and share high-level data types between Wasm modules and their hosts. The Component Model uses the WebAssembly Interface Type (WIT) format to define these types, which can then be used to generate bindings for different languages.

This project demonstrates how to use the WebAssembly Component Model to generate Java interfaces from a Wasm module, enabling seamless communication between Java and Wasm.



### Project Components

The project is divided into the following sub-projects:

1. [wit-to-java](wit-to-java) This is a Rust-based code generator that takes a WIT file as input and generates Java boilerplate code. The generated code includes Java interfaces and classes that correspond to the types and functions defined in the WIT file. This component supports a subset of the Canonical ABI, including lists, records, and strings.

2. [wit-introduction](wit-introduction) This is a C++ project that compiles to a Wasm module using the `wasi-core` SDK. The project provides an introduction to creating a Wasm module that is compliant with the WebAssembly Component Model. It includes a WIT file, its implementation, and documentation on how to build the module.

3. [graalwasm-inspector](graalwasm) This is a Java project that demonstrates how to use the generated Java interfaces to interact with the Wasm module. The project uses the GraalVM to run the Wasm module and the generated Java code to call its functions.



### Getting Started

To get started with the project, you will need to install the following dependencies:

- **wasi-sdk:** The WebAssembly System Interface (WASI) SDK is a toolchain for compiling C/C++ and Rust to WebAssembly. You can download the SDK from the official website.

- **Rust:** The Rust programming language is required to build the `wit-to-java` code generator. You can install Rust using the `rustup` tool.

- **GraalVM:** GraalVM is a high-performance JDK distribution that supports multiple languages, including Java and WebAssembly. You can download GraalVM from the official website.

Once you have installed the dependencies, you can build the project by following the instructions in the `README.md` file for each sub-project.