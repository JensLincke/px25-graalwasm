#![allow(warnings)]

use anyhow::Result;
use std::fs;
use std::path::Path;
use wit_parser::{abi::{AbiVariant}, Function, Record, Resolve, Type, TypeDefKind, WorldItem, WorldKey};

/// Represents the metadata for a function being generated.
/// This has become a huge state blob now, would be good to refactor
pub struct FunctionMetaData {
    pub java_method_name: String,
    // The prologue handles argument setup and lowering data to Wasm.
    pub prologue: String,
    // The core Wasm function call.
    pub wasm_call: String,
    // The epilogue handles lifting results and freeing memory.
    pub epilogue: String,
    pub wasm_call_arguments: Vec<String>,
    pub allocated_vars: Vec<String>,
    pub export_return_type: Option<Type>,
    pub java_return_type: String,
    pub return_value: String,
    temp_var_count: u32,
}

impl FunctionMetaData {
    pub fn new() -> Self {
        FunctionMetaData {
            java_method_name: "".to_string(),
            // will do all the lowering here
            // allocate and write to wasm
            prologue: "".to_string(),
            // simply the executeVoid call
            wasm_call: "".to_string(),
            // lifting and cleanup
            epilogue: "".to_string(),
            wasm_call_arguments: vec![],
            allocated_vars: vec![],
            export_return_type: None,
            java_return_type: "".to_string(),
            return_value: "result".to_string(),
            temp_var_count: 0,
        }
    }

    /// helper function to create temp variables that are used in the method body
    pub fn new_temp_var(&mut self) -> String {
        let var = format!("temp{}", self.temp_var_count);
        self.temp_var_count += 1;
        var
    }
}

/// Converts a kebab-case string to Java's camelCase.
pub fn to_camel_case(s: &str, capitalize_first: bool) -> String {
    let mut result = String::new();
    let mut capitalize = capitalize_first;
    for c in s.chars() {
        if c == '-' {
            capitalize = true;
        } else if capitalize {
            result.push(c.to_ascii_uppercase());
            capitalize = false;
        } else {
            result.push(c);
        }
    }
    result
}

/// Determines if a WIT type is a primitive type.
pub fn is_primitive_type(ty: &Type) -> bool {
    matches!(
        ty,
        Type::U8
            | Type::S8
            | Type::U16
            | Type::S16
            | Type::U32
            | Type::S32
            | Type::U64
            | Type::S64
            | Type::F32
            | Type::F64
            | Type::Bool
            | Type::Char
    )
}

/// Converts a WIT type to its corresponding Java type name.
pub fn wit_to_java_type(resolve: &Resolve, ty: &Type, use_boxed_types: bool) -> String {
    if use_boxed_types {
        match ty {
            Type::U8 | Type::S8 => "Byte".to_string(),
            Type::U16 | Type::S16 => "Short".to_string(),
            Type::U32 | Type::S32 => "Integer".to_string(),
            Type::U64 | Type::S64 => "Long".to_string(),
            Type::F32 => "Float".to_string(),
            Type::F64 => "Double".to_string(),
            Type::Bool => "Boolean".to_string(),
            Type::Char => "Character".to_string(),
            Type::String => "String".to_string(),
            Type::Id(type_id) => {
                let typedef = &resolve.types[*type_id];
                match &typedef.kind {
                    TypeDefKind::List(inner_ty) => {
                        format!("java.util.List<{}>", wit_to_java_type(resolve, inner_ty, true))
                    }
                    TypeDefKind::Record(_) => {
                        typedef.name.as_ref().map(|n| to_camel_case(n, true)).unwrap_or_else(|| "Object".to_string())
                    }
                    TypeDefKind::Type(t) => wit_to_java_type(resolve, t, true),
                    _ => "Object".to_string(),
                }
            },
            &Type::ErrorContext => todo!()
        }
    } else {
        match ty {
            Type::U8 | Type::S8 => "byte".to_string(),
            Type::U16 | Type::S16 => "short".to_string(),
            Type::U32 | Type::S32 => "int".to_string(),
            Type::U64 | Type::S64 => "long".to_string(),
            Type::F32 => "float".to_string(),
            Type::F64 => "double".to_string(),
            Type::Bool => "boolean".to_string(),
            Type::Char => "char".to_string(),
            _ => wit_to_java_type(resolve, ty, true),
        }
    }
}

/// Calculates the size of a WIT type in bytes according to the Canonical ABI.
pub fn size_of(resolve: &Resolve, ty: &Type) -> usize {
    match ty {
        Type::Bool | Type::S8 | Type::U8 => 1,
        Type::S16 | Type::U16 => 2,
        Type::S32 | Type::U32 | Type::F32 | Type::Char => 4,
        Type::S64 | Type::U64 | Type::F64 => 8,
        Type::Id(type_id) => {
            let ty_def = &resolve.types[*type_id];
            match &ty_def.kind {
                TypeDefKind::Record(record) => {
                    let mut size = 0;
                    for field in &record.fields {
                        let alignment = alignment_of(resolve, &field.ty);
                        let padding = (alignment - (size % alignment)) % alignment;
                        size += padding;
                        size += size_of(resolve, &field.ty);
                    }
                    // Finally, the entire record must be aligned to its own largest alignment.
                    let record_alignment = alignment_of(resolve, ty);
                    let padding = (record_alignment - (size % record_alignment)) % record_alignment;
                    size + padding
                }
                TypeDefKind::List(_) | TypeDefKind::Type(Type::String) => 8,
                TypeDefKind::Type(t) => size_of(resolve, t),
                _ => 0,
            }
        }
        Type::String => 8,
        &Type::ErrorContext => todo!(),
    }
}

/// Calculates the alignment of a WIT type in bytes.
pub fn alignment_of(resolve: &Resolve, ty: &Type) -> usize {
    match ty {
        Type::Bool | Type::S8 | Type::U8 => 1,
        Type::S16 | Type::U16 => 2,
        Type::S32 | Type::U32 | Type::F32 | Type::Char => 4,
        Type::S64 | Type::U64 | Type::F64 => 8,
        Type::String => 4,
        Type::Id(type_id) => {
            let ty_def = &resolve.types[*type_id];
            match &ty_def.kind {
                TypeDefKind::Record(record) => {
                    // Start with a minimum alignment of 1.
                    let mut max_align = 1;
                    // Loop through each field to find the largest alignment requirement.
                    for field in &record.fields {
                        let field_align = alignment_of(resolve, &field.ty);
                        if field_align > max_align {
                            max_align = field_align;
                        }
                    }
                    max_align
                }
                TypeDefKind::List(_) => 4,
                TypeDefKind::Type(t) => alignment_of(resolve, t),
                _ => 1,
            }
        },
        &Type::ErrorContext => todo!()
    }
}

/// Helper to get the correct Java ByteBuffer method suffix for a primitive type.
pub fn get_buffer_method_suffix(ty: &Type) -> &str {
    match ty {
        Type::U8 | Type::S8 => "Byte",
        Type::U16 | Type::S16 => "Short",
        Type::U32 | Type::S32 => "Int",
        Type::U64 | Type::S64 => "Long",
        Type::F32 => "Float",
        Type::F64 => "Double",
        Type::Char => "Char",
        Type::Bool => "Byte", // Bools are lowered as bytes (0 or 1)
        _ => panic!("Unsupported primitive type for buffer method"),
    }
}

pub fn lower_string(meta: &mut FunctionMetaData, obj_var: &str, ptr_var: &str) {
    // holding the strings UTF_8 bytes
    let bytes_var = meta.new_temp_var();
    let content_ptr_var = meta.new_temp_var();
    let buffer_var = meta.new_temp_var();

    // convert the string to a byte array
    meta.prologue.push_str(&format!("        byte[] {bytes_var} = {obj_var}.getBytes(StandardCharsets.UTF_8);\n"));
    // get memory for the strings content
    // here alignment should be 1 because we will write single bytes
    meta.prologue.push_str(&format!("        int {content_ptr_var} = allocate({bytes_var}.length, 1);\n"));
    // note that we allocated memory, will need to free later
    meta.allocated_vars.push(content_ptr_var.clone());
    // write the byte array to the memory which we allocated
    meta.prologue.push_str(&format!("        writeBytes({content_ptr_var}, {bytes_var});\n"));

    // create the string descriptor for wasm
    meta.prologue.push_str(&format!("        ByteBuffer {buffer_var} = ByteBuffer.allocate(8).order(ByteOrder.LITTLE_ENDIAN);\n"));
    meta.prologue.push_str(&format!("        {buffer_var}.putInt({content_ptr_var}).putInt({bytes_var}.length);\n"));
    meta.prologue.push_str(&format!("        writeBytes({ptr_var}, {buffer_var}.array());\n"));
    return;
}

pub fn lower_record(resolve: &Resolve, ty: &Type, obj_var: &str, ptr_var: &str, meta: &mut FunctionMetaData, record: &Record) {
    let buffer_var = meta.new_temp_var();
    let size = size_of(resolve, ty);
    // create a ByteBuffer which is the exact same size as the WIT record.
    meta.prologue.push_str(&format!("        ByteBuffer {buffer_var} = ByteBuffer.allocate({size}).order(ByteOrder.LITTLE_ENDIAN);\n"));

    // this offset is necessary because we might have a record
    // record Point {int x, int y, double z};
    // so we first calculate the alignment which is 4,4,8
    // the offset is then used as a cursor to write on the ByteBuffer
    // for example temp.putInt(0, record.x()), temp.putInt(4, record.y()), temp.putDouble(8, record.z())
    let mut offset = 0;
    for field in &record.fields {
        let field_name = to_camel_case(&field.name, false);
        // creating the java accessor method for a record. For example point.x()
        let field_var = format!("{obj_var}.{field_name}()");
        let alignment = alignment_of(resolve, &field.ty);

        let padding = (alignment - (offset % alignment)) % alignment;
        offset += padding;

        if is_primitive_type(&field.ty) {
            // this is a ByteBuffer helper for putInt, putFloat, putDouble
            let suffix = get_buffer_method_suffix(&field.ty);
            let put_method = format!("put{suffix}");
            let value_to_put = if *(&field.ty) == Type::Bool {
                format!("(byte)({field_var} ? 1 : 0)")
            } else {
                field_var
            };
            meta.prologue.push_str(&format!("        {buffer_var}.{put_method}({offset}, {value_to_put});\n"));
        } else {
            // the good stuff, here we will recursively lower the nested objects!
            let nested_ptr_var = lower_to_new_ptr(resolve, &field.ty, &field_var, meta);
            // write the start address of the nested object.
            meta.prologue.push_str(&format!("        {buffer_var}.putInt({offset}, {nested_ptr_var});\n"));
        }
        offset += size_of(resolve, &field.ty);
    }
    meta.prologue.push_str(&format!("        writeBytes({ptr_var}, {buffer_var}.array());\n"));
}

pub fn lower_list(resolve: &Resolve, inner_ty: &Type, obj_var: &str, ptr_var: &str, meta: &mut FunctionMetaData) {
    // Calculate the size in bytes of a single element in the list
    let elem_size = size_of(resolve, inner_ty);
    // Generate the expression to get the List size
    let list_len_var = format!("{obj_var}.size()");
    // Create a new temporary variable name for the pointer to the allocated data
    let data_ptr_var = meta.new_temp_var();
    // Get the memory alignment requirement for a single element.
    let inner_align = alignment_of(resolve, inner_ty);

    meta.prologue.push_str(&format!("        int {data_ptr_var} = allocate({list_len_var} * {elem_size}, {inner_align});\n"));
    meta.allocated_vars.push(data_ptr_var.clone());

    let byte_buffer_var = meta.new_temp_var();
    // if the list contains records, we can create a single ByteBuffer
    // outside the loop and reuse it for serializing each record
    if let Type::Id(inner_id) = inner_ty {
        if let TypeDefKind::Record(_) = &resolve.types[*inner_id].kind {
            meta.prologue.push_str(&format!("        ByteBuffer {byte_buffer_var} = ByteBuffer.allocate({elem_size}).order(ByteOrder.LITTLE_ENDIAN);\n"));
        }
    }

    let loop_idx = meta.new_temp_var();
    meta.prologue.push_str(&format!("        for (int {loop_idx} = 0; {loop_idx} < {list_len_var}; {loop_idx}++) {{\n"));
    let current_list_entry = meta.new_temp_var();
    // resolve the elements of the list
    let inner_entry_type = wit_to_java_type(resolve, inner_ty, true);
    // access list elements
    meta.prologue.push_str(&format!("            {inner_entry_type} {current_list_entry} = {obj_var}.get({loop_idx});\n"));
    let elem_ptr_expr = format!("{data_ptr_var} + {loop_idx} * {elem_size}");

    // resolve the type of the list element
    if let Type::Id(inner_id) = inner_ty {
        // right now my basic example only has a list of records
        if let TypeDefKind::Record(inner_record) = &resolve.types[*inner_id].kind {
            // Clear the reusable ByteBuffer
            meta.prologue.push_str(&format!("            {byte_buffer_var}.clear();\n"));
            // Lower the record into a ByteBuffer
            lower_record_into_buffer(resolve, inner_record, &current_list_entry, &byte_buffer_var, meta);
            meta.prologue.push_str(&format!("            writeBytes({elem_ptr_expr}, {byte_buffer_var}.array());\n"));
        } else {
            // If it's another complex type (but not a record), use the general-purpose lowering function
            lower_at_ptr(resolve, inner_ty, &current_list_entry, &elem_ptr_expr, meta);
        }
    } else {
        lower_at_ptr(resolve, inner_ty, &current_list_entry, &elem_ptr_expr, meta);
    }

    meta.prologue.push_str("        }\n");

    // list descriptor
    let list_struct_buffer = meta.new_temp_var();
    meta.prologue.push_str(&format!("        ByteBuffer {list_struct_buffer} = ByteBuffer.allocate(8).order(ByteOrder.LITTLE_ENDIAN);\n"));
    meta.prologue.push_str(&format!("        {list_struct_buffer}.putInt({data_ptr_var}).putInt({list_len_var});\n"));
    meta.prologue.push_str(&format!("        writeBytes({ptr_var}, {list_struct_buffer}.array());\n"));
}

/// Lowers a Java object into Wasm memory at a given pointer.
/// Write or serialize the contents of the java object into an
/// already allocated memory location! We will use ByteBuffer
/// for that.
///
/// params:
/// ty: Type of the current param
/// obj_var: the java object
/// ptr_var: wasm memory location where we write the java object
pub fn lower_at_ptr(resolve: &Resolve, ty: &Type, obj_var: &str, ptr_var: &str, meta: &mut FunctionMetaData) {
    // When the parameter is a string, we know that they are represented
    // by an 8-byte struct containing a pointer to the string's content and the content's length
    if *ty == Type::String {
        lower_string(meta, obj_var, ptr_var);
    }

    if let Type::Id(type_id) = ty {
        let ty_def = &resolve.types[*type_id];
        match &ty_def.kind {
            TypeDefKind::Record(record) => {
                lower_record(resolve, ty, obj_var, ptr_var, meta, record);
            },
            TypeDefKind::List(inner_ty) => {
                lower_list(resolve, inner_ty, obj_var, ptr_var, meta);
            },
            _ => {}
        }
    } else if is_primitive_type(ty) {
        let suffix = get_buffer_method_suffix(ty);
        let put_method = format!("put{suffix}");
        let size = size_of(resolve, ty);
        let buffer_var = meta.new_temp_var();
        let value_to_put = if *ty == Type::Bool {
            format!("(byte)({obj_var} ? 1 : 0)")
        } else {
            obj_var.to_string()
        };
        meta.prologue.push_str(&format!("        ByteBuffer {buffer_var} = ByteBuffer.allocate({size}).order(ByteOrder.LITTLE_ENDIAN);\n"));
        meta.prologue.push_str(&format!("        {buffer_var}.{put_method}({value_to_put});\n"));
        meta.prologue.push_str(&format!("        writeBytes({ptr_var}, {buffer_var}.array());\n"));
    }
}

/// utility function to write a record into a bytebuffer
pub fn lower_record_into_buffer(resolve: &Resolve, record_type: &wit_parser::Record, obj_var: &str, buffer_var: &str, meta: &mut FunctionMetaData) {
    for field in &record_type.fields {
        let field_name = to_camel_case(&field.name, false);
        let field_var = format!("{obj_var}.{field_name}()");

        if is_primitive_type(&field.ty) {
            let suffix = get_buffer_method_suffix(&field.ty);
            let put_method = format!("put{suffix}");
            let value_to_put = if *(&field.ty) == Type::Bool {
                format!("(byte)({field_var} ? 1 : 0)")
            } else {
                field_var
            };
            meta.prologue.push_str(&format!("            {buffer_var}.{put_method}({value_to_put});\n"));
        } else {
            // in case the record has complex fields (for now not the case)
            let nested_ptr_var = lower_to_new_ptr(resolve, &field.ty, &field_var, meta);
            meta.prologue.push_str(&format!("            {buffer_var}.putInt({nested_ptr_var});\n"));
        }
    }
}

/// Lowers a Java object to a new Wasm memory location and returns the pointer variable name.
/// The most important this that it does is allocate memory for the java object.
pub fn lower_to_new_ptr(resolve: &Resolve, ty: &Type, obj_var: &str, meta: &mut FunctionMetaData) -> String {
    let size = size_of(resolve, ty);
    let alignment = alignment_of(resolve, ty);
    let ptr_var = meta.new_temp_var();

    meta.prologue.push_str(&format!("        int {ptr_var} = allocate({size}, {alignment});\n"));
    meta.allocated_vars.push(ptr_var.clone());

    lower_at_ptr(resolve, ty, obj_var, &ptr_var, meta);
    ptr_var
}

pub fn lift_string(result_var: &String, ptr_var: &str, meta: &mut FunctionMetaData) -> String {
    let struct_bytes_var = meta.new_temp_var();
    let buffer_var = meta.new_temp_var();
    let content_ptr_var = meta.new_temp_var();
    let len_var = meta.new_temp_var();
    let content_bytes_var = meta.new_temp_var();
    meta.epilogue.push_str(&format!("        byte[] {struct_bytes_var} = readBytes({ptr_var}, 8);\n"));
    meta.epilogue.push_str(&format!("        ByteBuffer {buffer_var} = ByteBuffer.wrap({struct_bytes_var}).order(ByteOrder.LITTLE_ENDIAN);\n"));
    meta.epilogue.push_str(&format!("        int {content_ptr_var} = {buffer_var}.getInt(0);\n"));
    meta.epilogue.push_str(&format!("        int {len_var} = {buffer_var}.getInt(4);\n"));
    meta.epilogue.push_str(&format!("        byte[] {content_bytes_var} = readBytes({content_ptr_var}, {len_var});\n"));
    meta.epilogue.push_str(&format!("        String {result_var} = new String({content_bytes_var}, StandardCharsets.UTF_8);\n"));
    meta.epilogue.push_str(&format!("        free({content_ptr_var}); // Free the string content memory allocated by Wasm\n"));
    result_var.clone()
}

pub fn lift_record(resolve: &Resolve, ty: &Type, meta: &mut FunctionMetaData, record: &Record, buffer_var: &String, result_var: &String) {
    // Get the Java class name for the record type
    let java_type = wit_to_java_type(resolve, ty, true);
    // Create a vector to hold the names of the Java variables for each lifted field
    let mut field_vars = Vec::new();
    // Initialize a cursor to track the current position while reading from the ByteBuffer
    let mut offset = 0;
    // Iterate over each field defined in the WIT record
    for field in &record.fields {
        let field_var = meta.new_temp_var();
        // Get the alignment requirement for the current field
        let alignment = alignment_of(resolve, &field.ty);
        // Calculate the padding needed to align the offset to the field's requirement
        let padding = (alignment - (offset % alignment)) % alignment;
        // Add the padding to the offset to align the cursor correctly
        offset += padding;

        if is_primitive_type(&field.ty) {
            // Get the appropriate method suffix for the ByteBuffer
            let suffix = get_buffer_method_suffix(&field.ty);
            let get_method = format!("get{suffix}");
            let field_java_type = wit_to_java_type(resolve, &field.ty, false);
            let lifted_val = format!("{buffer_var}.{get_method}({offset})");
            if *(&field.ty) == Type::Bool {
                meta.epilogue.push_str(&format!("        boolean {field_var} = {lifted_val} != 0;\n"));
            } else {
                meta.epilogue.push_str(&format!("        {field_java_type} {field_var} = {lifted_val};\n"));
            }
        } else {
            // If the field is a complex type, read the 4-byte pointer to the nested data from the current offset
            let field_ptr_var = meta.new_temp_var();
            meta.epilogue.push_str(&format!("        int {field_ptr_var} = {buffer_var}.getInt({offset});\n"));
            // Recursively call `lift_from_ptr` to deserialize the complex type from its pointer
            let lifted_field = lift_from_ptr(resolve, &field.ty, &field_ptr_var, meta);
            meta.epilogue.push_str(&format!("        {} {field_var} = {lifted_field};\n", wit_to_java_type(resolve, &field.ty, true)));
        }
        field_vars.push(field_var);
        // Advance the offset by the size of the current field to prepare for the next one
        offset += size_of(resolve, &field.ty);
    }
    let constructor_args = field_vars.join(", ");
    meta.epilogue.push_str(&format!("        {java_type} {result_var} = new {java_type}({constructor_args});\n"));
}

pub fn lift_list(resolve: &Resolve, inner_type: &Type, meta: &mut FunctionMetaData, buffer_var: &String, result_var: &String) {
    // Create a new temporary variable name for the pointer to the list's elements
    let data_ptr_var = meta.new_temp_var();
    let list_len_var = meta.new_temp_var();
    // Read the first 4 bytes (an integer) from the ByteBuffer, this is the pointer to the element data
    meta.epilogue.push_str(&format!("        int {data_ptr_var} = {buffer_var}.getInt(0);\n"));
    // Read the next 4 bytes from the ByteBuffer, this is the length of the list
    meta.epilogue.push_str(&format!("        int {list_len_var} = {buffer_var}.getInt(4);\n"));

    meta.epilogue.push_str(&format!("        java.util.List<{}> {result_var} = new java.util.ArrayList<>({list_len_var});\n",
                                    wit_to_java_type(resolve, inner_type, true)));

    // Looping all list elements!!!
    let loop_idx = meta.new_temp_var();
    meta.epilogue.push_str(&format!("        for (int {loop_idx} = 0; {loop_idx} < {list_len_var}; {loop_idx}++) {{\n"));
    // Calculate the size of each element in bytes to know how far to step in memory for each iteration
    let elem_size = size_of(resolve, inner_type);
    // Calculate the memory address of the current element by taking the base data pointer and adding the offset
    let elem_ptr_expr = format!("{data_ptr_var} + {loop_idx} * {elem_size}");

    // Recursively call `lift_from_ptr` to generate the code that will read the element from its memory address
    let lifted_elem = lift_from_ptr(resolve, inner_type, &elem_ptr_expr, meta);
    meta.epilogue.push_str(&format!("            {result_var}.add({lifted_elem});\n"));
    meta.epilogue.push_str("        }\n");
    meta.epilogue.push_str(&format!("        free({data_ptr_var});"));
}

/// Generates Java code to lift a value of a given WIT type from a pointer in Wasm memory.
/// Returns the name of the Java variable that holds the lifted value.
pub fn lift_from_ptr(resolve: &Resolve, ty: &Type, ptr_var: &str, meta: &mut FunctionMetaData) -> String {
    let result_var = meta.new_temp_var();

    if *ty == Type::String {
        return lift_string(&result_var, ptr_var, meta);
    }

    // Create a temporary variable for a byte array that will hold the raw data.
    let bytes_var = meta.new_temp_var();
    // Create a temporary variable name for the ByteBuffer that will wrap the byte array.
    let buffer_var = meta.new_temp_var();
    // Calculate the size of the type's (list has always 8, struct may vary)
    let size = size_of(resolve, ty);
    meta.epilogue.push_str(&format!("        byte[] {bytes_var} = readBytes({ptr_var}, {size});\n"));
    meta.epilogue.push_str(&format!("        ByteBuffer {buffer_var} = ByteBuffer.wrap({bytes_var}).order(ByteOrder.LITTLE_ENDIAN);\n"));

    if let Type::Id(type_id) = ty {
        let ty_def = &resolve.types[*type_id];
        match &ty_def.kind {
            TypeDefKind::Record(record) => {
                lift_record(resolve, ty, meta, record, &buffer_var, &result_var);
            },
            TypeDefKind::List(inner_ty) => {
                lift_list(resolve, inner_ty, meta, &buffer_var, &result_var);
            },
            _ => {}
        }
    } else if is_primitive_type(ty) {
        let suffix = get_buffer_method_suffix(ty);
        let get_method = format!("get{suffix}");
        let lifted_val = format!("{buffer_var}.{get_method}(0)");
        if *ty == Type::Bool {
            meta.epilogue.push_str(&format!("        boolean {result_var} = {lifted_val} != 0;\n"));
        } else {
            meta.epilogue.push_str(&format!("        {} {result_var} = {lifted_val};\n",
                                            wit_to_java_type(resolve, ty, false)));
        }
    }
    result_var
}

/// Generates Java code to handle function parameters.
pub fn process_function_parameters(resolve: &Resolve, func: &Function, meta: &mut FunctionMetaData) {
    for (name, ty) in &func.params {
        let var_name = to_camel_case(name, false);
        if is_primitive_type(ty) {
            meta.wasm_call_arguments.push(var_name.clone());
        } else {
            meta.prologue.push_str(&format!("        // Lowering parameter '{name}' to wasm memory\n"));
            let ptr_var = lower_to_new_ptr(resolve, ty, &var_name, meta);
            meta.wasm_call_arguments.push(ptr_var);
        }
    }
}

/// Generates the Java code for a single function from the WIT.
pub fn generate_function_java(resolve: &Resolve, pkg: &wit_parser::Package, interface_export_name: &str, func: &Function) -> String {
    let mut meta = FunctionMetaData::new();

    // extract only the function name but not the arguments
    meta.java_method_name = to_camel_case(&func.name, false);
    meta.java_return_type = match &func.result {
        Some(ty) => wit_to_java_type(resolve, ty, false),
        None => "void".to_string(),
    };
    meta.export_return_type = func.result.clone();

    // Lets start with the prologue here, we will lower the java types
    // to WIT types.
    process_function_parameters(resolve, func, &mut meta);

    let wasm_signature = resolve.wasm_signature(AbiVariant::GuestExport, func);
    // the retptr tells us whether the export will return a pointer or a primitive type
    // when there is a pointer returned, we need to take care of the memory.
    if wasm_signature.retptr {
        let return_type = func.result.as_ref().unwrap();
        let size_to_allocate = size_of(resolve, return_type);
        let alignment = alignment_of(resolve, return_type);
        meta.prologue.push_str(&format!("        int result_ptr = allocate({size_to_allocate}, {alignment});\n"));
        meta.wasm_call_arguments.push("result_ptr".to_string());
        meta.allocated_vars.push("result_ptr".to_string());
    }

    // this is now the "method_body", simply call into wasm
    let pkg_name_mangled = format!("{}_{}", pkg.name.namespace, pkg.name.name);
    let wasm_func_name = format!(
        "exports_{}_{}_{}",
        pkg_name_mangled,
        interface_export_name,
        func.name.replace('-', "_")
    );

    let call_args_str = meta.wasm_call_arguments.join(", ");

    // the wasm call and primitive return type. No need to handle memory.
    if let Some(return_type) = &meta.export_return_type {
        if is_primitive_type(return_type) {
            meta.wasm_call.push_str(&format!(
                "        {} result = wasmModule.getMember(\"{wasm_func_name}\").execute({call_args_str}).as{}();\n",
                meta.java_return_type,
                to_camel_case(&meta.java_return_type, true)
            ));
        } else {
            meta.wasm_call.push_str(&format!("        wasmModule.getMember(\"{wasm_func_name}\").executeVoid({call_args_str});\n"));
        }
    }

    let export_return_type = meta.export_return_type.clone();
    // this is where we try to lift the result and do the cleanup
    if let Some(return_type) = &export_return_type {
        if !is_primitive_type(return_type) {
            meta.epilogue.push_str("        // Lifting result from wasm memory\n");
            let lifted_result = lift_from_ptr(resolve, return_type, "result_ptr", &mut meta);
            meta.return_value = lifted_result;
        }
    }

    for var_name in meta.allocated_vars.iter().rev() {
        meta.epilogue.push_str(&format!("        free({var_name});\n"));
    }

    if meta.java_return_type != "void" {
        meta.epilogue.push_str(&format!("\n        return {};\n", meta.return_value));
    }

    let params_str = func
        .params
        .iter()
        .map(|(name, ty)| {
            format!(
                "{} {}",
                wit_to_java_type(resolve, ty, false),
                to_camel_case(name, false)
            )
        })
        .collect::<Vec<_>>()
        .join(", ");

    format!(
        "    public {} {}({}) {{\n{}{}{}\n    }}\n\n",
        meta.java_return_type, meta.java_method_name, params_str, meta.prologue, meta.wasm_call, meta.epilogue
    )
}

pub fn run_generator(wit_path: &str, output_file: &str, package_name: &str) -> Result<()> {
    let mut resolve = Resolve::default();
    let pkg_id = resolve
        .push_path(Path::new(wit_path))
        .expect("Failed to parse WIT file");
    let pkg = &resolve.packages[pkg_id.0];

    let world_id = resolve.packages[pkg_id.0]
        .worlds
        .values()
        .next()
        .expect("No world found in WIT file");
    let world = &resolve.worlds[*world_id];

    let (interface_export_name, interface_id) = world
        .exports
        .iter()
        .find_map(|(key, item)| {
            if let WorldItem::Interface { id, .. } = *item {
                let name = match key {
                    WorldKey::Name(n) => n.clone(),
                    WorldKey::Interface(i) => resolve.interfaces[*i].name.as_ref().unwrap().clone(),
                };
                return Some((name, id));
            }
            None
        })
        .expect("Did not find any named interface exported from the world");

    // maybe a small diagram to show the good point of using rust for wit parsing
    // show the lower/lifting in highlighted code

    let interface = &resolve.interfaces[interface_id];
    println!(
        "Found interface '{}', generating bindings...",
        interface_export_name
    );

    let mut java_code_buffer = String::new();
    let class_name = Path::new(output_file)
        .file_stem()
        .and_then(|s| s.to_str())
        .unwrap_or("DefaultBindings");

    // Use the derived class_name in the boilerplate
    let java_boilerplate = format!(
        r#"package {package_name};
import org.graalvm.polyglot.*;
import org.graalvm.polyglot.io.ByteSequence;
import java.io.IOException;
import java.net.URL;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.charset.StandardCharsets;

public class {class_name} {{
    private final Value wasmModule;
    private final Value memory;
    private final Value cabi_realloc;

    public {class_name}(URL wasmResource, Context context) throws IOException {{
        byte[] wasmBytes = wasmResource.openStream().readAllBytes();
        Source source = Source.newBuilder("wasm", ByteSequence.create(wasmBytes), "main").build();
        context.eval(source);

        this.wasmModule = context.getBindings("wasm").getMember("main");
        this.memory = wasmModule.getMember("memory");
        this.cabi_realloc = wasmModule.getMember("cabi_realloc");
    }}

    private int allocate(int size, int alignment) {{
        return cabi_realloc.execute(0, 0, alignment, size).asInt();
    }}

    private void free(int ptr) {{
        cabi_realloc.execute(ptr, 0, 1, 0);
    }}

    private void writeBytes(int ptr, byte[] data) {{
        for (int i = 0; i < data.length; i++) {{
             memory.setArrayElement(ptr + i, data[i]);
         }}
    }}

    private byte[] readBytes(int ptr, int len) {{
         byte[] data = new byte[len];
         for (int i = 0; i < len; i++) {{
             data[i] = memory.getArrayElement(ptr + i).asByte();
         }}
         return data;
    }}
"#,
        class_name = class_name
    );
    java_code_buffer.push_str(java_boilerplate.as_str());

    for func in interface.functions.values() {
        java_code_buffer.push_str(&generate_function_java(
            &resolve,
            pkg,
            &interface_export_name,
            func,
        ));
    }

    java_code_buffer.push_str("}\n");

    fs::write(output_file, &java_code_buffer)?;
    println!("Generated {}", output_file);

    Ok(())
}

