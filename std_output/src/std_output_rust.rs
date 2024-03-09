use std::time::Instant;
fn main() {
    let start = Instant::now(); 
    for i in 0..50000 {
        println!("{:?}", i);
    }
    println!("{:?}", start.elapsed().as_nanos());
}