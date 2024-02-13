fn main() {
    let mut a = 0;
    for _ in 0..100000000 {
        a += 3;
    }
    println!("{}", a);
}