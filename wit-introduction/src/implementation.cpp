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

void exports_docs_adder_simple_add_point(exports_docs_adder_simple_point_t *x, exports_docs_adder_simple_point_t *y, exports_docs_adder_simple_point_t *ret) {
    ret->x = x->x + y->x;
    ret->y = x->y + y->y;
}

void exports_docs_adder_simple_sub_point(exports_docs_adder_simple_point_t *x, exports_docs_adder_simple_point_t *y, exports_docs_adder_simple_point_t *ret) {
    ret->x = x->x - y->x;
    ret->y = x->y - y->y;
}

void exports_docs_adder_simple_scale_points(exports_docs_adder_simple_list_point_t *x, uint32_t scalar, exports_docs_adder_simple_list_point_t *ret) {
    const size_t n = x->len;
    ret->ptr = static_cast<exports_docs_adder_simple_point_t *>(malloc(n * sizeof(exports_docs_adder_simple_point_t)));
    if (!ret->ptr) {
        ret->len = 0;
        return;
    }
    ret->len = n;

    for (size_t i = 0; i < n; i++) {
        ret->ptr[i].x = x->ptr[i].x * scalar;
        ret->ptr[i].y = x->ptr[i].y * scalar;
    }
}