package utils

import (
	"github.com/aaronlerch3/lofi/api/env"
)

// IsDebug check if in debug mode
func IsDebug() bool {
	return env.Mode == "debug"
}
