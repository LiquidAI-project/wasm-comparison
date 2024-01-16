#!/bin/bash

# Initialize variables
runs=50


calculate_average_time() {
    local filename=$1
    local base_filename=$(basename "$filename" .wasm)

    average_time_bin=$(for (( i=0; i<$runs; i++ ))
    do
        (/usr/bin/time -f "%e" ./"$filename") 2>&1
    done | awk '{sum+=$1} END {print sum/NR*1000}')

    echo "Average time for $base_filename: $average_time_bin ms"

    average_time_wasmtime=$(for (( i=0; i<$runs; i++ ))
    do
        (/usr/bin/time -f "%e" wasmtime wasm/"$base_filename".wasm) 2>&1
    done | awk '{sum+=$1} END {print sum/NR*1000}')

    echo "Average time for wasmtime $base_filename.wasm: $average_time_wasmtime ms"

    average_time_wasmer=$(for (( i=0; i<$runs; i++ ))
    do
        (/usr/bin/time -f "%e" wasmer wasm/"$base_filename".wasm) 2>&1
    done | awk '{sum+=$1} END {print sum/NR*1000}')

    echo "Average time for wasmer $base_filename.wasm: $average_time_wasmer ms"
}

# Iterate over all files in bin directory
for filename in bin/*; do
    calculate_average_time "$filename"
done