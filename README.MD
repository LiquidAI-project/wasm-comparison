# Project Name

## Overview

This project demonstrates a multi-language, multi-platform compilation and benchmarking setup for C, Rust, and Go programs targeting both native (aarch64 - raspberry pi 4b) and WebAssembly (WASM) environments.

## Project Structure

The project is organized into multiple directories, each representing a separate module. Within each directory, the source files are located in the `src` subdirectory, and the compiled outputs are placed in either the `wasm` directory for WebAssembly modules or the `bin` directory for native binaries. binaries and wasm files available in the repository are alligned with the current version of the code.

- `/<module_name>/src/`: Contains source files for the module. Supports `.c`, `.rs`, and `.go` files.
- `/<module_name>/wasm/`: Contains compiled WebAssembly modules.
- `/<module_name>/bin/`: Contains compiled native binaries.

## Scripts

### Compilation Script (`compile`)

This Bash script automates the compilation process fo source files into both WebAssembly modules and native binaries.

- **C files:** Uses `clang` from the WASI SDK for WebAssembly compilation and `aarch64-linux-gnu-gcc` for native aarch64 binaries.
- **Rust files:** Utilizes `rustc` for both WebAssembly (with the `wasm32-wasi` target) and native (with the `aarch64-unknown-linux-gnu` target) compilation.
- **Go files:** Employs `tinygo` for WebAssembly compilation targeting the `wasi` environment and the standard Go compiler for native aarch64 binaries with appropriate environment variables.

### Benchmarking Script (`run`)

This Bash script facilitates the benchmarking of compiled binaries and WebAssembly modules using `perf stat`. It supports benchmarking in native execution and within WebAssembly runtimes such as `wasmtime` and `wasmer`.

- Benchmarks are executed for each compiled binary and WebAssembly module.
- Performance metrics cycles, instructions, task-clock, and duration_time are captured.
- Results are appended to a timestamped output file.

## Usage
0. **Setup:** Ensure all dependencies are correctly installed and accessible in your environment and you are in a aarch64 environment.
1. **Compiling the Code:** Execute the `compile` script from the root of the project directory to compile all source files into WebAssembly modules and native binaries.
2. **Running Benchmarks:** Execute the `run` script to benchmark the compiled outputs. The script will generate a detailed performance report in a timestamped text file.

## Requirements

- [WASI SDK](https://github.com/WebAssembly/wasi-sdk) for C compilation to WebAssembly.
- [Rust](https://www.rust-lang.org/tools/install) compiler (`rustc`) with `wasm32-wasi` and `aarch64-unknown-linux-gnu` targets configured.
- Go compiler (`go`) and [TinyGo](https://tinygo.org/) for Go source compilation.
- `aarch64-linux-gnu-gcc` for compiling native aarch64 binaries. (cross-compilation)
- `perf` tool for capturing performance metrics.
- [wasmtime](https://wasmtime.dev/) and [wasmer](https://wasmer.io/) for running WebAssembly modules.

Ensure all dependencies are correctly installed and accessible in your environment before running the scripts.

## License



