package auth

import (
	"context"
	"net/http"

	"go.mongodb.org/mongo-driver/bson"
	"go.mongodb.org/mongo-driver/mongo"

	"github.com/aaronlerch3/lofi/api/db"
	"github.com/aaronlerch3/lofi/api/env"
	"github.com/aaronlerch3/lofi/api/graph/model"
	googleVerifier "github.com/futurenda/google-auth-id-token-verifier"
)

type googleAuthBody struct {
	IDToken string `json:"id_token"`
}

const googleAuthType = "google"

var verifier = googleVerifier.Verifier{}

// LoginGoogle create google auth / login
func LoginGoogle(ctx context.Context, token string) (*model.MutationRes, error) {
	if err := verifier.VerifyIDToken(token, []string{
		env.GoogleWebClientID,
		env.GoogleMobileClientID,
	}); err != nil {
		return nil, err
	}
	claims, err := googleVerifier.Decode(token)
	if err != nil {
		return nil, err
	}
	// now token is valid
	// check if user exists already
	var user model.User
	var foundUser bool
	if err := db.UserCollection.FindOne(db.CTXMongo, bson.M{
		"email": claims.Email,
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
		user, err = db.CreateUser(claims.Email, claims.Name, googleAuthType, "", true)
		if err != nil {
			return nil, err
		}
	} else if user.AuthType != googleAuthType {
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
