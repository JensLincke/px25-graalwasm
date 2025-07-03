package org.example;

import org.graalvm.polyglot.Value;

public interface AdderInterface {
    int exports_docs_adder_simple_add_int(int x, int y);
    float exports_docs_adder_simple_add_float(float x, float y);
    double exports_docs_adder_simple_add_double(double x, double y);
    void exports_docs_adder_simple_get_statistics_int(int x, int y);

    Value memory();
    int cabi_realloc(int ptr, int oldSize, int align, int newSize);
}
