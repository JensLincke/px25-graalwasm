cmake_minimum_required(VERSION 3.18)
project(wasm_cpp)

set(CMAKE_CXX_STANDARD 17)

# Standard install directories
include(GNUInstallDirs)
include(GenerateExportHeader)

option(EMSCRIPTEN ON)

add_executable(wasm_cpp src/wasm_math.cpp)

if(EMSCRIPTEN)
    message("We are using emscripten")
    set(CMAKE_EXECUTABLE_SUFFIX ".wasm")
    target_link_options(wasm_cpp PRIVATE
            "-sSTANDALONE_WASM"
            "--no-entry"
            "--export=add"
            "--profiling-funcs"
    )
endif()

set_target_properties(wasm_cpp PROPERTIES LINKER_LANGUAGE CXX)
