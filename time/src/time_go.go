package main

import (
	"time"
)

func main() {
	start := time.Now()
	for i := 0; i < 50000; i++ {
		time.Now()
	}
	duration := time.Since(start)
	println(duration.Nanoseconds())
}
