fn main() {
    let mut data = Vec::with_capacity(1024 * 1024);
    data[0] = 5;
    data[1024] = 10;
    data[1024 * 1023] = 15;
}
