package graph

// This file will be automatically regenerated based on the schema, any resolver implementations
// will be copied through when generating and any unknown code will be moved to the end.

import (
	"context"
	"fmt"

	"github.com/aaronlerch3/lofi/api/auth"
	"github.com/aaronlerch3/lofi/api/graph/generated"
	"github.com/aaronlerch3/lofi/api/graph/model"
	"github.com/aaronlerch3/lofi/api/utils"
	"github.com/aws/aws-sdk-go/aws"
	cognito "github.com/aws/aws-sdk-go/service/cognitoidentityprovider"
)

func (r *mutationResolver) CreateDiscussionThread(ctx context.Context, name string) (*model.MutationRes, error) {
	panic(fmt.Errorf("not implemented"))
}

func (r *mutationResolver) CreateUser(ctx context.Context, input *model.CreateUserInput) (*model.MutationRes, error) {
	userCreateRes, err := auth.Client.CognitoClient.SignUp(&cognito.SignUpInput{
		Username: aws.String(input.Username),
		Password: aws.String(input.Password),
		ClientId: aws.String(*auth.Client.AppClientID),
		UserAttributes: []*cognito.AttributeType{
			{
				Name:  aws.String("name"),
				Value: aws.String(input.Name),
			},
		},
	})
	if err != nil {
		utils.Logger.Info("got error: " + err.Error())
		return nil, err
	}
	// save user to database
	/*
		user := &model.User{
			Name:     &input.Name,
			Username: &input.Username,
		}
	*/
	mutationRes := &model.MutationRes{
		Message: "Created user " + *userCreateRes.UserSub,
		Status:  200,
	}
	return mutationRes, nil
}

func (r *mutationResolver) UpdateUser(ctx context.Context, input *model.UpdateUserInput) (*model.MutationRes, error) {
	panic(fmt.Errorf("not implemented"))
}

func (r *mutationResolver) DeleteUser(ctx context.Context) (*model.MutationRes, error) {
	panic(fmt.Errorf("not implemented"))
}

func (r *mutationResolver) Login(ctx context.Context, username string, password string) (*model.MutationRes, error) {
	panic(fmt.Errorf("not implemented"))
}

// Mutation returns generated.MutationResolver implementation.
func (r *Resolver) Mutation() generated.MutationResolver { return &mutationResolver{r} }

type mutationResolver struct{ *Resolver }
