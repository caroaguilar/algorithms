package main

import (
    "fmt"
)

func main() {

    for n := 1; n <= 20; n++ {
        divBy3 := n % 3 == 0
        divBy5 := n % 5 == 0

        switch {
        case divBy3 && divBy5:
            fmt.Println("fizz buzz")
        case divBy3:
            fmt.Println("fizz")
        case divBy5:
            fmt.Println("buzz")
        default:
            fmt.Println(n)
        }
    }
}