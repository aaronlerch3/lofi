package auth

import (
	"errors"
	"os"

	"github.com/aaronlerch3/lofi/api/server"
	"github.com/markbates/goth"
	"github.com/markbates/goth/providers/github"
)

// InitializeAuth initialize OAuth client
func InitializeAuth() error {
	githubKey := os.Getenv("GITHUB_KEY")
	if len(githubKey) == 0 {
		return errors.New("no github key provided")
	}
	githubSecret := os.Getenv("GITHUB_SECRET")
	if len(githubSecret) == 0 {
		return errors.New("no github secret provided")
	}
	goth.UseProviders(
		github.New(githubKey, githubSecret, "http://localhost:"+server.Port+"/auth/github/callback"),
	)
	return nil
}
