package main

import (
	"fmt"
	"time"
)

func main() {
	t := time.Now()
	for i := 0; i < 100; i++ {
		t = time.Now()
	}
	fmt.Printf("time: %d\n", t.UnixNano())
}
