use std::time::{Instant, SystemTime};

fn main() {
    let start =Instant::now();
    for i in 0..50000 {
        SystemTime::now();
    }
    println!("{:?}", start.elapsed().as_nanos());
}