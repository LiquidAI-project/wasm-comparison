use std::time::Instant;

fn fibonacci(n: i32) -> i32 {
    if n <= 1 {
        return n;
    }
    return fibonacci(n - 1) + fibonacci(n - 2);
}

fn main() {
    let start = Instant::now(); 

    fibonacci(37);

    println!("{:?}", start.elapsed().as_nanos());
}
