package graph

// This file will be automatically regenerated based on the schema, any resolver implementations
// will be copied through when generating and any unknown code will be moved to the end.

import (
	"context"
	"fmt"

	"github.com/aaronlerch3/lofi/api/graph/generated"
	"github.com/aaronlerch3/lofi/api/graph/model"
)

func (r *mutationResolver) CreateDiscussionThread(ctx context.Context, name string) (*model.MutationRes, error) {
	panic(fmt.Errorf("not implemented"))
}

// Mutation returns generated.MutationResolver implementation.
func (r *Resolver) Mutation() generated.MutationResolver { return &mutationResolver{r} }

type mutationResolver struct{ *Resolver }
