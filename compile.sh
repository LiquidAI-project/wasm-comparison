#!/bin/bash

CC () {
    # replace with the path to your wasi-sdk
    /home/mj/wasi-sdk-21.0/bin/clang --sysroot=/home/mj/wasi-sdk-21.0/share/wasi-sysroot "$@"
}
for dir in */; do
    for filename in "$dir"/src/*.c; do
        base_filename=$(basename "$filename" .c)
        CC "$filename" -o "$dir"/wasm/"$base_filename".wasm
        aarch64-linux-gnu-gcc "$filename" -o "$dir"/bin/"$base_filename"
    done
    for filename in "$dir"/src/*.rs; do
        base_filename=$(basename "$filename" .rs)
        rustc "$filename" -o "$dir"/wasm/"$base_filename".wasm --target=wasm32-wasi
        rustc "$filename" -o "$dir"/bin/"$base_filename" --target=aarch64-unknown-linux-gnu -C linker=aarch64-linux-gnu-gcc
    done
    for filename in "$dir"/src/*.go; do
        base_filename=$(basename "$filename" .go)
        tinygo build -o "$dir"/wasm/"$base_filename".wasm -target wasi "$filename"
        GOARCH=arm64 GOOS=linux go build -o "$dir"/bin/"$base_filename" "$filename"
    done
done