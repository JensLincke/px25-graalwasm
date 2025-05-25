#include <cstdlib>
#include <cstring>

#include "adder.h"

uint32_t exports_docs_adder_simple_add_int(uint32_t x, uint32_t y) {
    return x + y;
}

float exports_docs_adder_simple_add_str(float x, float y) {
    return x + y;
}

double exports_docs_adder_simple_add_double(double x, double y) {
    return x + y;
}

void exports_docs_adder_simple_concat(adder_string_t *x, adder_string_t *y, adder_string_t *ret) {
    const size_t total = x->len + y->len;
    auto *buf = static_cast<uint8_t *>(malloc(total));
    if (!buf) {
        ret->ptr = nullptr;
        ret->len = 0;
        return;
    }
    memcpy(buf, x->ptr, x->len);
    memcpy(buf + x->len, y->ptr, y->len);
    ret->ptr = buf;
    ret->len = total;
}

void exports_docs_adder_simple_reverse(adder_string_t *x, adder_string_t *ret) {
    const size_t n = x->len;
    auto *buf = static_cast<uint8_t *>(malloc(n));
    if (!buf) {
        ret->ptr = nullptr;
        ret->len = 0;
        return;
    }

    for (size_t i = 0; i < n; i++) {
        buf[i] = x->ptr[n - 1 - i];
    }

    ret->ptr = buf;
    ret->len = n;
}