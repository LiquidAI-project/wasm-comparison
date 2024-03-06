#!/bin/bash

runs=100
output_file=$(date +"%Y-%m-%d-%H-%M.txt")

benchmark() {
   local dir=$1
   local runtime=$2
   local filename=$3

   if [ "$runtime" == "bin" ]; then
     command="./$dir/bin/$filename"
   elif [ "$runtime" == "wasmtime" ]; then
     command="$(which wasmtime) $dir/wasm/$filename.wasm"
   elif [ "$runtime" == "wasmer" ]; then
     command="$(which wasmer) $dir/wasm/$filename.wasm"
   fi

   echo "Benchmarking $runtime $filename:" | tee -a $output_file

   for i in $(seq 1 $runs); do
     output=$(nice -n -20 $command)
     last_line=$(echo "$output" | tail -n1)
     echo "$runtime $filename run $i: $last_line" | tee -a $output_file
   done
}

for dir in */; do
    for filename in "$dir"/bin/*; do
        base_filename=$(basename "$filename" .wasm)
        benchmark "$dir" "bin" "$base_filename"
        benchmark "$dir" "wasmtime" "$base_filename"
        benchmark "$dir" "wasmer" "$base_filename"
    done
done