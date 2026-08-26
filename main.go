package main

import (
	"os"

	jsoniter "github.com/json-iterator/go"
)

func main() {
	encoder := jsoniter.NewEncoder(os.Stdout)
	encoder.Encode("Hello, World!")
}
