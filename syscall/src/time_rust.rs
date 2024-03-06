use std::time::{Instant, SystemTime};

fn main() {
    let start =Instant::now();
    for _ in 0..10000 {
        SystemTime::now();
    }
    println!("{:?}", start.elapsed().as_nanos());
}