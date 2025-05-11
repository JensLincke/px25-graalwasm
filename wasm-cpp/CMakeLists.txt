cmake_minimum_required(VERSION 3.18)
project(wasm_cpp)

set(CMAKE_CXX_STANDARD 17)

# Standard install directories
include(GNUInstallDirs)
include(GenerateExportHeader)

option(EMSCRIPTEN ON)

add_library(wasm_cpp STATIC src/wasm_math.h)
target_compile_options(wasm_cpp PRIVATE -g4)

if(EMSCRIPTEN)
    message("We are using emscripten")
    target_link_options(wasm_cpp PRIVATE "-sSTANDALONE_WASM --no-entry -nostdlib++ --debug-names")
endif()

set_target_properties(wasm_cpp PROPERTIES LINKER_LANGUAGE CXX)
generate_export_header(wasm_cpp EXPORT_FILE_NAME "${CMAKE_CURRENT_BINARY_DIR}/src/Export.h" BASE_NAME wasm-cpp)

target_include_directories(wasm_cpp PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/src)

add_executable(wasm_module main.cpp)
target_link_libraries(wasm_module wasm_cpp)
target_link_options(wasm_module PRIVATE "--debug-names")

#[[add_executable(test_app main.cpp)
target_link_libraries(test_app PRIVATE wasm_cpp)]]

install(DIRECTORY include/ DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})
