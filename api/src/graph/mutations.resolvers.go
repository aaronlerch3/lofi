package graph

// This file will be automatically regenerated based on the schema, any resolver implementations
// will be copied through when generating and any unknown code will be moved to the end.

import (
	"context"
	"fmt"
	"net/http"

	"github.com/aaronlerch3/lofi/api/graph/generated"
	"github.com/aaronlerch3/lofi/api/graph/model"
)

func (r *mutationResolver) CreateDiscussionThread(ctx context.Context, name string) (*model.MutationRes, error) {
	panic(fmt.Errorf("not implemented"))
}

func (r *mutationResolver) CreateUser(ctx context.Context, input *model.CreateUserInput) (*model.MutationRes, error) {
	mutationRes := &model.MutationRes{
		Message: "Created user",
		Status:  http.StatusOK,
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
