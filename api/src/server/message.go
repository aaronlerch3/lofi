package server

// MessageType generic message type
type MessageType struct {
	Message string `json:"message"`
	Code    int    `json:"code"`
}
