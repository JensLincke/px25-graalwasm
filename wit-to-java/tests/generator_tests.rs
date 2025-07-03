#![allow(warnings)]
use wit_java_generator::*;

use std::path::Path;
use wit_parser::{Resolve, Type, PackageId};

// A helper function to parse a WIT file and return a Resolve and PackageId
// for use in tests.
fn parse_wit_from_file(path: &str) -> (Resolve, PackageId) {
    let mut resolve = Resolve::default();
    let pkg_id = resolve.push_path(Path::new(path)).unwrap();
    (resolve, pkg_id.0)
}

#[test]
fn test_to_camel_case() {
    assert_eq!(to_camel_case("kebab-case-string", false), "kebabCaseString");
    assert_eq!(to_camel_case("another-one", false), "anotherOne");
    assert_eq!(to_camel_case("capitalize-this", true), "CapitalizeThis");
    assert_eq!(to_camel_case("simple", false), "simple");
}

#[test]
fn test_buffer_method_suffix() {
    assert_eq!(get_buffer_method_suffix(&Type::U8), "Byte");
    assert_eq!(get_buffer_method_suffix(&Type::U16), "Short");
    assert_eq!(get_buffer_method_suffix(&Type::U32), "Int");
    assert_eq!(get_buffer_method_suffix(&Type::U64), "Long");
    assert_eq!(get_buffer_method_suffix(&Type::F32), "Float");
    assert_eq!(get_buffer_method_suffix(&Type::F64), "Double");
    assert_eq!(get_buffer_method_suffix(&Type::U64), "Long");
}

#[test]
fn test_big_struct_size() {
    let (resolve, _) = parse_wit_from_file("tests/wit/test_wit.wit");

    let big_struct_id = resolve.interfaces
        .iter()
        .find(|(_, iface)| iface.name == Some("simple".to_string()))
        .unwrap().1.types["big-struct"];

    let struct_type = Type::Id(big_struct_id);
    assert_eq!(size_of(&resolve, &struct_type), 40);
    assert_eq!(alignment_of(&resolve, &struct_type), 8);
}

#[test]
fn test_nested_struct_size() {
    let (resolve, _) = parse_wit_from_file("tests/wit/test_wit.wit");

    let big_struct_id = resolve.interfaces
        .iter()
        .find(|(_, iface)| iface.name == Some("simple".to_string()))
        .unwrap().1.types["outer"];

    let struct_type = Type::Id(big_struct_id);
    assert_eq!(size_of(&resolve, &struct_type), 24);
    assert_eq!(alignment_of(&resolve, &struct_type), 8);
}

#[test]
fn test_size_and_alignment() {
    let (resolve, _) = parse_wit_from_file("tests/wit/test_wit.wit");

    let point_type_id = resolve.interfaces
        .iter()
        .find(|(_, iface)| iface.name == Some("simple".to_string()))
        .unwrap().1.types["point"];

    let point_type = Type::Id(point_type_id);

    // A `point` is { u32, u32, f64 }.
    // Sizes: 4, 4, 8.
    // Alignments: 4, 4, 8.
    // Max alignment is 8.
    // Layout:
    // 0-3: x (u32)
    // 4-7: y (u32)
    // 8-15: z (f64)
    // Total size is 16.
    assert_eq!(size_of(&resolve, &point_type), 16);
    assert_eq!(alignment_of(&resolve, &point_type), 8);

    // A list of points is a (ptr, len) pair.
    let list_of_points_id = resolve.interfaces
        .iter()
        .find(|(_, iface)| iface.name == Some("simple".to_string()))
        .unwrap().1.types["list-point"];
    let list_of_points = Type::Id(list_of_points_id);
    assert_eq!(size_of(&resolve, &list_of_points), 8);
    assert_eq!(alignment_of(&resolve, &list_of_points), 4);
}

#[test]
fn test_scale_points_snapshot() {
    let (resolve, pkg_id) = parse_wit_from_file("tests/wit/test_wit.wit");
    let pkg = &resolve.packages[pkg_id];
    let interface = resolve.interfaces.iter().next().unwrap().1;
    let func = &interface.functions["scale-points"];

    let generated_code = generate_function_java(&resolve, pkg, "simple", func);

    let expected_code_buffer = r#"           public java.util.List<Point> scalePoints(java.util.List<Point> x, int scalar) {
        // Lowering parameter 'x' to wasm memory
        int temp0 = allocate(8, 4);
        int temp1 = allocate(x.size() * 16, 8);
        ByteBuffer temp2 = ByteBuffer.allocate(16).order(ByteOrder.LITTLE_ENDIAN);
        for (int temp3 = 0; temp3 < x.size(); temp3++) {
            Point temp4 = x.get(temp3);
            temp2.clear();
            temp2.putInt(temp4.x());
            temp2.putInt(temp4.y());
            temp2.putDouble(temp4.z());
            writeBytes(temp1 + temp3 * 16, temp2.array());
        }
        ByteBuffer temp5 = ByteBuffer.allocate(8).order(ByteOrder.LITTLE_ENDIAN);
        temp5.putInt(temp1).putInt(x.size());
        writeBytes(temp0, temp5.array());
        int result_ptr = allocate(8, 4);
        wasmModule.getMember("exports_docs_adder_simple_scale_points").executeVoid(temp0, scalar, result_ptr);
        // Lifting result from wasm memory
        byte[] temp7 = readBytes(result_ptr, 8);
        ByteBuffer temp8 = ByteBuffer.wrap(temp7).order(ByteOrder.LITTLE_ENDIAN);
        int temp9 = temp8.getInt(0);
        int temp10 = temp8.getInt(4);
        java.util.List<Point> temp6 = new java.util.ArrayList<>(temp10);
        for (int temp11 = 0; temp11 < temp10; temp11++) {
        byte[] temp13 = readBytes(temp9 + temp11 * 16, 16);
        ByteBuffer temp14 = ByteBuffer.wrap(temp13).order(ByteOrder.LITTLE_ENDIAN);
        int temp15 = temp14.getInt(0);
        int temp16 = temp14.getInt(4);
        double temp17 = temp14.getDouble(8);
        Point temp12 = new Point(temp15, temp16, temp17);
            temp6.add(temp12);
        }
        free(temp9);
        free(result_ptr);
        free(temp1);
        free(temp0);

        return temp6;

    }

"#;
    // NOTE: The snapshot test is sensitive to whitespace and variable names.
    // A real snapshot library like `insta` would handle this more gracefully.
    // For now, we normalize whitespace to make it a bit more robust.
    let normalize = |s: &str| s.split_whitespace().collect::<Vec<_>>().join(" ");
    assert_eq!(normalize(&generated_code), normalize(expected_code_buffer));
}
