#!/bin/bash

runs=500
output_file=$(date +"%Y-%m-%d-%H-%M.txt")

benchmark() {
   local dir=$1
   local runtime=$2
   local filename=$3

   if [ "$runtime" == "bin" ]; then
     command="./$dir/bin/$filename"
   elif [ "$runtime" == "wasmtime" ]; then
     command="/home/mj/.wasmtime/bin/wasmtime $dir/wasm/$filename.wasm"
   elif [ "$runtime" == "wasmer" ]; then
     command="/home/mj/.wasmer/bin/wasmer $dir/wasm/$filename.wasm"
   fi  

   echo "Benchmarking $runtime $filename:" | tee -a $output_file

  for i in $(seq 1 $runs); do
    sync
    temp_file=$(mktemp)
    nice -n -20 $command > $temp_file
    last_line=$(tail -n1 $temp_file)
    echo "$runtime $filename run $i: $last_line" | tee -a $output_file
    rm $temp_file
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