package utils

import "github.com/go-resty/resty/v2"

// HTTPClient global http client
var HTTPClient *resty.Client

func createRESTClient() {
	HTTPClient = resty.New()
}
