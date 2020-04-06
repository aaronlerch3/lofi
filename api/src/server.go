package main

import (
	"log"
	"net/http"
	"os"

	"github.com/99designs/gqlgen/graphql/handler"
	"github.com/99designs/gqlgen/graphql/playground"
	"github.com/aaronlerch3/lofi/api/auth"
	"github.com/aaronlerch3/lofi/api/db"
	"github.com/aaronlerch3/lofi/api/graph"
	"github.com/aaronlerch3/lofi/api/graph/generated"
	"github.com/aaronlerch3/lofi/api/utils"
	"github.com/joho/godotenv"
)

const defaultPort = "8080"

func main() {
	if err := godotenv.Load(); err != nil {
		panic("Error loading .env file")
	}
	utils.SetMode()
	if err := utils.GenerateLogger(); err != nil {
		panic(err)
	}
	if err := utils.CreateSession(); err != nil {
		utils.Logger.Fatal(err.Error())
	}
	if err := db.InitializeDB(); err != nil {
		utils.Logger.Fatal(err.Error())
	}
	if err := auth.InitializeAuth(); err != nil {
		utils.Logger.Fatal(err.Error())
	}
	port := os.Getenv("PORT")
	if port == "" {
		port = defaultPort
	}
	srv := handler.NewDefaultServer(generated.NewExecutableSchema(generated.Config{Resolvers: &graph.Resolver{}}))

	http.Handle("/", playground.Handler("GraphQL playground", "/query"))
	http.Handle("/query", srv)

	utils.Logger.Info("Connect to http://localhost:" + port + " for playground 🚀")
	log.Fatal(http.ListenAndServe(":"+port, nil))
}
