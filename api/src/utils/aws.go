package utils

import (
	"github.com/aws/aws-sdk-go/aws/session"
)

// AWSSession aws session
var AWSSession *session.Session

// CreateSession creates aws session
func CreateSession() error {
	// get config from ~/.aws/credentials and ~/.aws/config
	var err error
	if AWSSession, err = session.NewSessionWithOptions(session.Options{
		SharedConfigState: session.SharedConfigEnable,
	}); err != nil {
		return err
	}
	return nil
}
