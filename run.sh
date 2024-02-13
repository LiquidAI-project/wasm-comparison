#!/bin/bash

runs=1

output_file=$(date +"%Y-%m-%d-%H-%M.txt")

benchmark_with_perf_stat() {
   local dir=$1
   local runtime=$2
   local filename=$3

   if [ "$runtime" == "bin" ]; then
     command="./$dir/bin/$filename"
   else
     command="$runtime $dir/wasm/$filename.wasm"
   fi

   echo "Benchmarking $runtime $filename:" | tee -a $output_file

   perf stat -r $runs -d -o $output_file --append \
        -e cycles,instructions,task-clock,duration_time \
        $command 2>&1 | grep -E '^[[:space:]]+\d+[[:space:]]'
}
for dir in */; do
    for filename in "$dir"/bin/*; do
        base_filename=$(basename "$filename" .wasm)
        benchmark_with_perf_stat "$dir" "bin" "$base_filename"
        benchmark_with_perf_stat "$dir" "wasmtime" "$base_filename"
        benchmark_with_perf_stat "$dir" "wasmer" "$base_filename"
    done
done
