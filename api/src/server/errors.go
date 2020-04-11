package server

import (
	"net/http"

	json "github.com/json-iterator/go"
)

// HandleError handles errors
func HandleError(res *http.ResponseWriter, errorObj error, status int) error {
	jsonData, err := json.Marshal(&MessageType{
		Message: errorObj.Error(),
		Code:    status,
	})
	if err != nil {
		return err
	}
	(*res).WriteHeader(status)
	(*res).Header().Set("Content-Type", "application/json")
	if _, err = (*res).Write(jsonData); err != nil {
		return err
	}
	return nil
}
