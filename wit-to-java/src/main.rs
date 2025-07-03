#![allow(warnings)]
use wit_java_generator::run_generator;
use anyhow::Result;

fn main() -> Result<()> {
    // Define the input and output file paths here.
    // In a real CLI app, you'd parse these from args.
    let wit_path = "adder.wit";
    let output_file = "SimpleBindings.java";

    // Call the main generator logic from the library.
    run_generator(wit_path, output_file)
}
