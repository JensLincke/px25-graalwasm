# Notes

1. The wat file seems to be in Lisp format. 
2. But it would be better to get this information from Graal. 

## Try this out

1. First, WasmFunction::paramCount() then iterate with public byte WasmFunction::paramTypeAt(int argumentIndex) --> looks at the symbol table
2. After getting the parameter types, we can use ValueType fromByteValue(byte value) to map the bytes to wasm types
3. Then we can reconstruct signature.