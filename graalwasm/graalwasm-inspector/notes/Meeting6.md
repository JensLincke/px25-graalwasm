# Notes

1. Use GraalWasm internals to allocate memory instead of calling the cabi_realloc.
2. wit-bindgen check how to generate bindings for host languages (TeaVM).
3. Binding should take care of allocation deallocation happening.