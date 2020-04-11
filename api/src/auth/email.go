package auth

import (
	"context"
	"errors"
	"net/http"

	"github.com/aaronlerch3/lofi/api/db"
	"github.com/aaronlerch3/lofi/api/graph/model"
)

const emailAuthType = "email"

// CreateUser function for creating user given email
func CreateUser(ctx context.Context, input *model.CreateUserInput) (*model.MutationRes, error) {
	userExists, err := db.CheckUserExists(input.Email)
	if err != nil {
		return nil, err
	}
	if userExists {
		return nil, errors.New("user already registered with given email")
	}
	user, err := db.CreateUser(input.Email, input.Name, emailAuthType, input.Password, false)
	if err != nil {
		return nil, err
	}
	mutationRes := &model.MutationRes{
		Message: "Created user " + user.ID,
		Status:  http.StatusOK,
	}
	return mutationRes, nil
}
