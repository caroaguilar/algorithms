package main

import (
    "fmt"
    "net/http"
)

func contentType(url string) (string, error) {
    resp, err := http.Get(url)

    if err != nil {
        return "", err
    }

    defer resp.Body.Close()

    header := resp.Header.Get("Content-Type")

    if header == "" {
        return "", fmt.Errorf("can't find Content-Type header")
    }

    return header, nil

}


func main() {
    url := "https://golang.org"
    ct, err := contentType(url)

    if err != nil {
        fmt.Printf("ERROR: %s\n getting Content-Type header from url: %s", err, url)
        return
    }

    fmt.Println(ct)
}

