# Wasm Test Component

This project aims to create a simple wasm component that can be used in different hosts.

## Dependencies

```bash
cargo install --locked wasm-tools
cargo install wit-bindgen-cli
```

## wit-bindgen

wit-bindgen is a tool to generate guest language bindings from a given .wit file.

```bash
wit-bindgen c adder.wit
# Generating "adder.c"
# Generating "adder.h"
# Generating "adder_component_type.o"
```

1.adder.h (based on the adder world) with the prototype of the add function (prefixed by exports_) - uint32_t exports_docs_adder_add_add(uint32_t x, uint32_t y);. 2. adder.c that interfaces with the component model ABI to call your function. 3. adder_component_type.o which contains object code referenced in adder.c from an extern that must be linked via clang.

## Build

```bash
mkdir build && cd build
cmake -DCMAKE_TOOLCHAIN_FILE=/opt/wasi-sdk/share/cmake/wasi-sdk.cmake ..
make adder -j16 # this will create the p1 wasm module
make adder_component -j16 # this will convert the p1 module to a p2
```

## Run

```bash
wasmtime run --invoke 'add-int(7, 13)' ./adder.component.wasm
```

## WIT 

This document is just a representation of my limited understanding of WASM and the WASM component model. Take it with a grain of salt.

So in WASM we have modules. A module is a single `.wasm` file which contains functions, memory, imports and exports. These modules can easily be run in a browser when loaded by some javascript runtime, or it can even run on other runtimes like Graal or Wasmtime.

The problem with wasm modules seems to be the fact that they can export their functionality to the outside through a small set of wasm types, essentially only integers and floats. Higher level structures like strings, structs, classes have to be broken down and expressed by pointers and offsets and that often leads to incompatibility with other languages.

The component model aims to resolve these issues by using the WIT (wasm interface type) to define higher level structures. A common definition of types is only one part of the problem. We still have to figure out how to actually represent these types in bits and bytes. The representation and translation of WIT to bits and bytes is done by the Canonical ABI. I have to read more about the Canonical ABI.

So now that we have an idea what the component model is about, we can say that a wasm component is simply a wasm module that specifies its imports and exports using the WIT.


# WIT
THE WIT is the Interface Definition Language (IDL) used to define functionality for a wasm module. Similar to thrift in other languages.

## Components
Components are containers for modules - or other components - which express their interfaces and dependencies via WIT. A component is also a specially-formatted WebAssembly file. Internally, the component could include multiple traditional ("core") WebAssembly modules, and sub-components, composed via their imports and exports.

## Interfaces
The interface is the formal definition/contract through which components can interact with each other or with a host. Interfaces describe the types and functions that carry out the interaction. Interfaces are defined using WIT. Interfaces are directional. This means that an interface indicates whether it is available for outside code to call it, or whether outside code must fulfill the interface for the component to call (import).

## WIT Worlds
Ok so this is where things get interesting. WIT Worlds are higher level contracts that define a components capabilities (exports) and needs (imports). Worlds describe the surface of a component. The surface of a component is the set of the exports and imports of the component. The surface does not contain any implementation details. We can also think of the world as being a set of interfaces.
A world also defines a hosting environment for the component. That is simply an environment in which a component can be instantiated and its functionality can be invoked. But for a component to be instantiated, the environment has to satisfy the components imports. If I have a component that uses IO, networking or the filesystem, then the environment has to provide the aforementioned dependencies in order to be a hosting environment.

## Structure of a WIT File
A WIT file contains one or more **interfaces** or **worlds**. An interface or world can define **types** and/or **functions**. Types and functions can't be defined outside of interfaces or worlds.

## Built-in types in WIT
1. bool
2. s8, s16, s32, s64 - signed integers
3. u8, u16, u32, u64 - unsigned integers
4. f32, f64 - floats (f64 is a double)
5. char - unicode character
6. string - unicode string
7. list<> - denotes an ordered sequence of values of type T
8. option<> - for any type T, the option may or may not contain that value. Similar to std::optional in c++
9. result<,> for any types T,E the result may contain one or the other but not both. Similar to std::variant in c++
10. tuples - ordere fixed length sequence of values of specified types

## User defined types in WIT

You can define your own types within an `interface` or `world`. WIT offers several ways of defining new types.
### Records
A `record` type declares a set of named fields, each of the form `name: type`, separated by commas. A record instance contains a value for every field. Field types can be built-in or user-defined. The syntax is as follows:

```wit
record customer {
    id: u64,
    name: string,
    picture: option<list<u8>>,
    account-manager: employee,
}
```

### Variants
A `variant` type declares one or more cases. Each case has a name and, optionally, a type of data associated with that case. A variant instance contains exactly one case. Basically an enum with associated data

```wit
variant allowed-destinations {
    none,
    any,
    restricted(list<address>)
}
```

### Interfaces
An interface is a named set of types and functions, enclosed in braces and introduced with the `interface` keyword:

```wit
interface canvas {
    type canvas-id = u64;

    record point {
        x: u32,
        y: u32,
    }

    draw-line: func(canvas: canvas-id, from: point, to: point);
}
```

### Worlds
A world describes a set of imports and exports, enclosed in braces and introduced with the `world` keyword. Roughly, a world describes the contract of a component. Exports are provided by the component, and define what consumers of the component may call; imports are things the component may call. The imports and exports may be interfaces or individual functions.

```wit
interface printer {
    print: func(text: string);
}

interface error-reporter {
    report-error: func(error-message: string);
}

world multi-function-device {
    // The component implements the `printer` interface
    export printer;

    // The component implements the `scan` function
    export scan: func() -> list<u8>;

    // The component needs to be supplied with an `error-reporter`
    import error-reporter;
}
```

**P1 (Reactor Modules)**

- Introduces the **reactor execution model** (`-mexec-model=reactor`) and **interface types** in the core Wasm module format.
- Lets you embed high-level types (strings, records, lists) and have the compiler generate the **Canonical ABI** glue so a host can marshal data without manual serialization .
- **No metadata** about worlds or named instances—just one Wasm module with interface-typed imports/exports.

**P2 (Full Components)**

- Builds on P1 by wrapping one or more reactor modules into a **self-describing package**:
    1. **World definitions** (from WIT) in custom sections
    2. **Named import instances** (e.g. WASI, host-defined APIs)
    3. A **default export world** tying everything together
- Enables a Component-Model–aware runtime (e.g. Wasmtime) to **auto-link** imports, discover dependencies, compose multiple components, and perform versioning.