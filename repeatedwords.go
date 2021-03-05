package main

import (
    "fmt"
    "strings"
)

func main() {
	text := `
	Needles and pins
	Needles and pins
	Sew me a sail
	To catch me the wind
	`

	words := strings.Fields(text)
	wc := map[string]int{}

	for _, word := range words {
		wc[strings.ToLower(word)]++
	}

	fmt.Println(wc)
}