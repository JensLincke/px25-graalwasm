#![allow(warnings)]
use std::env;
use std::process;
use wit_java_generator::run_generator;

type Result<T> = std::result::Result<T, Box<dyn std::error::Error>>;

fn main() -> anyhow::Result<()> {
    let args: Vec<String> = env::args().collect();
    if args.len() < 4 {
        eprintln!("Error: Not enough arguments provided.");
        eprintln!("Usage: {} <path-to-wit-file> <path-to-output-file> <package-name>", args[0]);
        process::exit(1);
    }
    let wit_path = &args[1];
    let output_file = &args[2];
    let package_name = &args[3];

    run_generator(wit_path, output_file, package_name)
}
