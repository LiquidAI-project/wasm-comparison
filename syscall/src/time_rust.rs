use std::time::{SystemTime, UNIX_EPOCH};

fn main() {
    let mut t = SystemTime::now();
    for _ in 0..100 {
        t = SystemTime::now();
    }
    println!("time: {}", t.duration_since(UNIX_EPOCH).unwrap().as_nanos());
}