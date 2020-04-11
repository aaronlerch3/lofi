package graph

// This file will be automatically regenerated based on the schema, any resolver implementations
// will be copied through when generating and any unknown code will be moved to the end.

import (
	"context"
	"fmt"

	"github.com/aaronlerch3/lofi/api/auth"
	"github.com/aaronlerch3/lofi/api/graph/generated"
	"github.com/aaronlerch3/lofi/api/graph/model"
)

func (r *mutationResolver) CreateDiscussionThread(ctx context.Context, name string) (*model.MutationRes, error) {
	panic(fmt.Errorf("not implemented"))
}

func (r *mutationResolver) LoginFacebook(ctx context.Context, token string) (*model.MutationRes, error) {
	return auth.LoginFacebook(ctx, token)
}

func (r *mutationResolver) LoginGoogle(ctx context.Context, token string) (*model.MutationRes, error) {
	return auth.LoginGoogle(ctx, token)
}

func (r *mutationResolver) CreateUser(ctx context.Context, input *model.CreateUserInput) (*model.MutationRes, error) {
	return auth.CreateUser(ctx, input)
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
