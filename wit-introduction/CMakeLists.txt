cmake_minimum_required(VERSION 3.28)

project(wit_introduction)

set(CMAKE_CXX_STANDARD 17)

set(WASM_TARGET_FLAGS
        -target
        wasm32-unknown-wasi
        -mexec-model=reactor
)
set(WASM_FLAGS "-target wasm32-unknown-wasi -mexec-model=reactor")
set(WASI_ADAPTER "/opt/wasi-sdk/share/wasi-sysroot/lib/wasm32-wasi/wasi_snapshot_preview1.wasm")

add_executable(adder src/adder.c src/implementation.cpp src/adder_component_type.o)
target_compile_options(adder PRIVATE ${WASM_TARGET_FLAGS})
target_link_options(adder PRIVATE ${WASM_TARGET_FLAGS}
        -Wl,--export=exports_docs_adder_simple_reverse)
set_target_properties(adder PROPERTIES
        OUTPUT_NAME "adder"
        SUFFIX      ".wasm"
)

add_custom_command(
        OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/adder.component.wasm
        COMMAND wasm-tools component new
        ${CMAKE_CURRENT_BINARY_DIR}/adder.wasm
        --adapt ${WASI_ADAPTER}
        -o ${CMAKE_CURRENT_BINARY_DIR}/adder.component.wasm
        DEPENDS adder
        COMMENT "Converting P1 adder.wasm → P2 adder.component.wasm"
)

add_custom_target(adder_component ALL
        DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/adder.component.wasm
        COMMENT "Built adder.component.wasm (P2 component)"
)