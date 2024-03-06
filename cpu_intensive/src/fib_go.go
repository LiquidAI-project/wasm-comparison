package main

import (
	"time"
)

func fibonacci(n int) int {
	if n <= 1 {
		return n
	}
	return fibonacci(n-1) + fibonacci(n-2)
}

func main() {
	start := time.Now()
	fibonacci(37)
	duration := time.Since(start)
	println(duration.Nanoseconds())
}
