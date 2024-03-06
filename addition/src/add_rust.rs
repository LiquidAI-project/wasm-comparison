use std::time::Instant;

fn main() {
    let start = Instant::now();
    for _ in 0..10000 {
    }
    println!("{:?}", start.elapsed().as_nanos());
}