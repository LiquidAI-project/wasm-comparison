package main

import "time"

// include time package
func main() {
	for i := 0; i < 1000; i++ {
		time.Now()
	}
}
