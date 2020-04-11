package auth

import (
	"context"
	"net/http"

	"github.com/aaronlerch3/lofi/api/db"
	"github.com/aaronlerch3/lofi/api/env"
	"github.com/aaronlerch3/lofi/api/graph/model"
	"github.com/dghubble/go-twitter/twitter"
	"go.mongodb.org/mongo-driver/bson"
	"go.mongodb.org/mongo-driver/mongo"
	"golang.org/x/oauth2"
	"golang.org/x/oauth2/clientcredentials"
)

const twitterAuthType = "twitter"

// LoginTwitter create twitter auth / login
func LoginTwitter(ctx context.Context, token string) (*model.MutationRes, error) {
	// oauth2 configures a client that uses app credentials to keep a fresh token
	config := &clientcredentials.Config{
		ClientID:     env.TwitterKey,
		ClientSecret: env.TwitterSecret,
		TokenURL:     "https://api.twitter.com/oauth2/token",
	}
	// http.Client will automatically authorize Requests
	httpClient := config.Client(oauth2.NoContext)
	// Twitter client
	client := twitter.NewClient(httpClient)
	twitterData, _, err := client.Accounts.VerifyCredentials(&twitter.AccountVerifyParams{
		IncludeEntities: twitter.Bool(false),
		SkipStatus:      twitter.Bool(true),
		IncludeEmail:    twitter.Bool(true),
	})
	if err != nil {
		return nil, err
	}
	// now token is valid
	// check if user exists already
	var user model.User
	var foundUser bool
	if err := db.UserCollection.FindOne(db.CTXMongo, bson.M{
		"email": twitterData.Email,
	}).Decode(&user); err != nil {
		if err == mongo.ErrNoDocuments {
			foundUser = false
		} else {
			return nil, err
		}
	} else {
		foundUser = true
	}
	if !foundUser {
		user, err = db.CreateUser(twitterData.Email, twitterData.Name, twitterAuthType, "", true)
		if err != nil {
			return nil, err
		}
	} else if user.AuthType != facebookAuthType {
		return nil, err
	}
	jwtToken, err := GenerateJWT(user.ID, user.Email, user.UserType, user.CurrentPlan)
	if err != nil {
		return nil, err
	}
	mutationRes := &model.MutationRes{
		Message: jwtToken.Raw,
		Status:  http.StatusOK,
	}
	return mutationRes, nil
}
