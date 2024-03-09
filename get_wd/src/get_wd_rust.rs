use std::time::Instant;
use std::env;

fn main() {
    let start = Instant::now();
    for _ in 0..50000 {
        env::current_exe();
    }
    println!("{:?}", start.elapsed().as_nanos());
}