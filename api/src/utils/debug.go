package utils

import (
	"os"
)

var mode string

// IsDebug check if in debug mode
func IsDebug() bool {
	return mode == "debug"
}

// SetMode set process mode
func SetMode() {
	mode = os.Getenv("MODE")
}
