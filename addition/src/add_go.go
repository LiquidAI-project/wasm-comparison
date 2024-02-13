package main

import (
	"fmt"
)

func main() {
	a := 0
	for i := 0; i < 100000000; i++ {
		a += 3
	}
	fmt.Println(a)
}
