#include "wasm_math.h"

extern "C" {

    __attribute__((used))
    int add(int a, int b) {
        return a + b;
    }
}