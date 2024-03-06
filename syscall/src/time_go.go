package main

import (
	"time"
)

func main() {
	start := time.Now()
	for i := 0; i < 10000; i++ {
		time.Now()
	}
	duration := time.Since(start)
	println(duration.Nanoseconds())
}
