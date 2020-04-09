package server

import (
	"net/http"
	"os"

	"github.com/99designs/gqlgen/graphql/handler"
	"github.com/99designs/gqlgen/graphql/playground"
	"github.com/aaronlerch3/lofi/api/graph"
	"github.com/aaronlerch3/lofi/api/graph/generated"
	"github.com/aaronlerch3/lofi/api/utils"
	"github.com/gorilla/mux"
	"github.com/gorilla/sessions"
	"github.com/markbates/goth/gothic"
)

// Port port the server is connected to
var Port string

const defaultPort = "8080"

var router *mux.Router

func setupAuthRoutes() {
	gothic.Store = sessions.NewCookieStore([]byte(os.Getenv("SESSION_SECRET")))
	router.HandleFunc("/auth/{provider}/callback", func(res http.ResponseWriter, req *http.Request) {
		user, err := gothic.CompleteUserAuth(res, req)
		if err != nil {
			utils.Logger.Info(err.Error())
			return
		}
		utils.Logger.Info(user.Provider)
	})

	router.HandleFunc("/logout/{provider}", func(res http.ResponseWriter, req *http.Request) {
		gothic.Logout(res, req)
		res.Header().Set("Location", "/login")
		res.WriteHeader(http.StatusTemporaryRedirect)
	})

	router.HandleFunc("/auth/{provider}", func(res http.ResponseWriter, req *http.Request) {
		// try to get the user without re-authenticating
		if gothUser, err := gothic.CompleteUserAuth(res, req); err == nil {
			utils.Logger.Info(gothUser.Name)
			res.Header().Set("Location", "/profile")
			res.WriteHeader(http.StatusTemporaryRedirect)
		} else {
			gothic.BeginAuthHandler(res, req)
		}
	})
}

// StartServer start the server
func StartServer() error {
	Port = os.Getenv("PORT")
	if len(Port) == 0 {
		Port = defaultPort
	}
	srv := handler.NewDefaultServer(generated.NewExecutableSchema(generated.Config{Resolvers: &graph.Resolver{}}))

	router = mux.NewRouter()
	router.Handle("/", playground.Handler("GraphQL playground", "/query"))
	router.Handle("/query", srv)
	setupAuthRoutes()

	utils.Logger.Info("Connect to http://localhost:" + Port + " for playground 🚀")
	if err := http.ListenAndServe(":"+Port, router); err != nil {
		return err
	}
	return nil
}
