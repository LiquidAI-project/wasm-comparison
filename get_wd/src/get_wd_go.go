package main

import (
	"os"
	"time"
)

func main() {
	start := time.Now()
	for i := 0; i < 50000; i++ {
		os.Getwd()
	}
	duration := time.Since(start)
	println(duration.Nanoseconds())
}
