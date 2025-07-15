# WIT to Java Bindings Generator

`wit-to-java` is a command-line tool written in Rust that automatically generates the Java boilerplate code required to interact with a WebAssembly (Wasm) module that conforms to the Wasm Component Model. It parses a WebAssembly Interface Type (WIT) file and produces a Java class with methods that handle the data marshalling (lowering and lifting) between the Java host and the Wasm guest.

This tool is a core component of the `px25-graalwasm` project, bridging the gap between high-level Java types and the low-level memory representation defined by the Wasm Canonical ABI.

## The Problem it Solves

Standard WebAssembly modules can only communicate with their host environment using a limited set of primitive numeric types (integers and floats). This makes passing complex data structures like strings, records (structs), or lists a manual and error-prone process, requiring developers to write significant "glue code" to serialize data into the Wasm module's linear memory and deserialize it back.

The **WebAssembly Component Model** and **WIT** provide a standardized way to define these high-level interfaces. However, you still need language-specific bindings to implement the logic for this data exchange. `wit-to-java` automates the creation of these bindings for the Java language when running on a host like GraalWasm.

## How It Works

The generator follows a multi-step process to create the Java bindings:

1. **Parsing WIT:** It uses the `wit-parser` Rust crate to parse the specified `.wit` file. This builds an in-memory representation (AST) of the worlds, interfaces, types, and functions defined in the file.

2. **Analyzing the Interface:** It identifies the exported interface from the WIT world and iterates through its functions.

3. **Generating Java Methods:** For each function in the WIT interface, it generates a corresponding public Java method. The method signature is translated from WIT types to their Java equivalents (e.g., `list<string>` becomes `java.util.List<String>`).

4. **Lowering (Java to Wasm):** For each method parameter, it generates the necessary Java code to "lower" the Java object into the Wasm module's linear memory. This involves:
   
   - Allocating memory within the Wasm module using the exported `cabi_realloc` function.
   
   - Serializing the Java object into a `ByteBuffer` according to the rules of the Canonical ABI (handling size, alignment, and padding).
   
   - Writing the `ByteBuffer`'s content into the allocated Wasm memory.

5. **Invoking Wasm:** It generates the code to call the target exported function from the Wasm module, passing pointers or primitive values as required.

6. **Lifting (Wasm to Java):** If the Wasm function returns a complex type, it generates the "lifting" code to reconstruct the Java object from the data returned in Wasm memory. This is the reverse of the lowering process.

7. **Memory Management:** The generator automatically tracks all memory allocated during the lowering process and generates `free()` calls to prevent memory leaks in the Wasm module.

## Features

- **Primitives:** Direct mapping of WIT primitive types (`u32`, `f64`, etc.) to Java primitives (`int`, `double`).

- **Strings:** Automatic handling of string marshalling and memory management.

- **Records:** Translates WIT `record` types into Java methods that work with corresponding Java `record` classes.

- **Lists:** Supports lists of primitives and lists of records.

- **Canonical ABI Compliance:** Implements a subset of the Canonical ABI for data layout, size, and alignment.

## Dependencies

To build and run the `wit-to-java` generator, you only need the **Rust toolchain** (including `cargo`).

- Install Rust via [rustup](https://rustup.rs/ "null").

## Usage

`wit-to-java` is a command-line application.

### Build

Navigate to the `wit-to-java` directory and build the project using `cargo`:

```
cargo build --release
```

The executable will be available at `target/release/wit_java_generator`.

### Run

Execute the generator from the command line, providing the paths to the input WIT file, the desired output Java file, and the Java package name.

**Syntax:**

```
./target/release/wit_java_generator <path-to-wit-file> <path-to-output-file> <package-name>
```

**Example:**

Assuming you have a file `adder.wit` in a `wit/` directory and you want to generate `SimpleBindings.java` in the `org.example` package:

```
./target/release/wit_java_generator wit/adder.wit src/main/java/org/example/SimpleBindings.java org.example
```

This will create the `SimpleBindings.java` file, which you can then include in your Java project (like `graalwasm-inspector`) to interact with the corresponding Wasm component.
