package main

func main() {
	data := make([]int, 1024*1024)
	data[0] = 5
	data[1024] = 10
	data[1024*1023] = 15
}
