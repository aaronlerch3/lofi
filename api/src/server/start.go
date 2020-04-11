package server

import (
	"net/http"

	"github.com/99designs/gqlgen/graphql/handler"
	"github.com/99designs/gqlgen/graphql/playground"
	"github.com/aaronlerch3/lofi/api/env"
	"github.com/aaronlerch3/lofi/api/graph"
	"github.com/aaronlerch3/lofi/api/graph/generated"
	"github.com/aaronlerch3/lofi/api/utils"
	"github.com/gorilla/mux"
)

// Router routes for server
var Router *mux.Router

// StartServer start the server
func StartServer() error {
	srv := handler.NewDefaultServer(generated.NewExecutableSchema(generated.Config{Resolvers: &graph.Resolver{}}))

	Router = mux.NewRouter()
	Router.Handle("/", playground.Handler("GraphQL playground", "/query"))
	Router.Handle("/query", srv)

	utils.Logger.Info("Connect to http://localhost:" + env.Port + " for playground 🚀")
	if err := http.ListenAndServe(":"+env.Port, Router); err != nil {
		return err
	}
	return nil
}
