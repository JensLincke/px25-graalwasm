# Notes

1. Inspect the generated object file. 
2. Check why there are these docs: exports.
3. Take a look at wasi_snapshot_preview1 and what it is enabling in GraalWasm.
4. Maybe its interesting to compare the WIT Bindgen vs Emcsripten approach. 
5Assume that now we are the host language inspecting the wit file: `reverse: func(x: string) -> string;`
6Use something (Python or find a better alternative) to script the generation of P1Loader.
   1. Find a language which can already parse WIT, don't spend time with importing it. 
   2. Find a language that can generate java. 

```java
//reverse: func(x: string) -> string;

String reverse(String x)
{
    int cString = createCString(x);
    // we know how big the WIT string is (from the canonical ABI)
    int res = alloocate(8);
    // we know that we can call export.reverse(cString, res);
    String javaString = fromCString(res);
    // now we can cleanup
    free(cString);
    free(res);
    return javaString;
}
```