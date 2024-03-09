package main

import (
	"time"
)

type Node struct {
	data int
	next *Node
}

func main() {
	start := time.Now()
	head := &Node{data: 0}
	tail := head
	for i := 0; i < 50000; i++ {
		node := &Node{data: i}
		tail.next = node
		tail = node
	}
	duration := time.Since(start)
	println(duration.Nanoseconds())
}
