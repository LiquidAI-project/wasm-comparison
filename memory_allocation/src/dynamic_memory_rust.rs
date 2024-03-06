use std::time::Instant;

fn main() {
    let start = Instant::now();
    let mut data = Vec::new();
    for i in 0..10000 {
        data.push(i);
    }
    println!("{:?}", start.elapsed().as_nanos());
}