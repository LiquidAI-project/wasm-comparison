#!/bin/bash

CC () {
    # replace with the path to your wasi-sdk
    /home/mj/wasi-sdk-21.0/bin/clang --sysroot=/home/mj/wasi-sdk-21.0/share/wasi-sysroot "$@"
}
for dir in */; do
    for filename in "$dir"/src/*.c; do
        base_filename=$(basename "$filename" .c)
        CC "$filename" -O0 -o "$dir"/wasm/"$base_filename".wasm
        clang -target aarch64-linux-gnu -march=armv8-a "$filename" -O0 -o "$dir"/bin/"$base_filename"
    done
    for filename in "$dir"/src/*.rs; do
        base_filename=$(basename "$filename" .rs)
        rustc "$filename" -o "$dir"/wasm/"$base_filename".wasm --target=wasm32-wasi -C opt-level=0 -C debuginfo=0 -C debug-assertions=off
        rustc "$filename" -o "$dir"/bin/"$base_filename" --target=aarch64-unknown-linux-gnu -C linker=clang -C link-arg=-target -C link-arg=aarch64-linux-gnu -C opt-level=0 -C debuginfo=0 -C debug-assertions=off
    done
    for filename in "$dir"/src/*.go; do
        base_filename=$(basename "$filename" .go)
        tinygo build -opt=0 -scheduler=none -o "$dir"/wasm/"$base_filename".wasm -target wasi "$filename"
        GOARCH=arm64 GOOS=linux tinygo build -opt=0 -scheduler=none -o "$dir"/bin/"$base_filename" "$filename"
    done
done
