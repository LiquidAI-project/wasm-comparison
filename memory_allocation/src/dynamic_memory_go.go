package main

import (
	"time"
)

func main() {
	start := time.Now()
	data := make([]int, 0)
	for i := 0; i < 10000; i++ {
		data = append(data, i)
	}
	duration := time.Since(start)
	println(duration.Nanoseconds())
}
