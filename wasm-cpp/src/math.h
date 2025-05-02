#pragma once

#include "Export.h"

#if defined(__cplusplus)
extern "C" {
#endif

// A simple function to add two integers
WASM_CPP_EXPORT int add(int a, int b) {
    return a + b;
}

#if defined(__cplusplus)
}
#endif
