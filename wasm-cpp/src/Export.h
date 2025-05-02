
#ifndef WASM_CPP_EXPORT_H
#define WASM_CPP_EXPORT_H

#ifdef WASM_CPP_STATIC_DEFINE
#  define WASM_CPP_EXPORT
#  define WASM_CPP_NO_EXPORT
#else
#  ifndef WASM_CPP_EXPORT
#    ifdef wasm_cpp_EXPORTS
        /* We are building this library */
#      define WASM_CPP_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define WASM_CPP_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef WASM_CPP_NO_EXPORT
#    define WASM_CPP_NO_EXPORT __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef WASM_CPP_DEPRECATED
#  define WASM_CPP_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef WASM_CPP_DEPRECATED_EXPORT
#  define WASM_CPP_DEPRECATED_EXPORT WASM_CPP_EXPORT WASM_CPP_DEPRECATED
#endif

#ifndef WASM_CPP_DEPRECATED_NO_EXPORT
#  define WASM_CPP_DEPRECATED_NO_EXPORT WASM_CPP_NO_EXPORT WASM_CPP_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef WASM_CPP_NO_DEPRECATED
#    define WASM_CPP_NO_DEPRECATED
#  endif
#endif

#endif /* WASM_CPP_EXPORT_H */
