package main

import (
	"fmt"

	"github.com/docker/docker/pkg/namesgenerator"
)

func main() {
	fmt.Print(namesgenerator.GetRandomName(0))
}
