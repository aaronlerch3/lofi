package auth

import (
	"context"
	"net/http"
	"strings"

	"github.com/aaronlerch3/lofi/api/db"
	"github.com/aaronlerch3/lofi/api/env"
	"github.com/aaronlerch3/lofi/api/graph/model"
	"github.com/aaronlerch3/lofi/api/utils"
	json "github.com/json-iterator/go"
	"go.mongodb.org/mongo-driver/bson"
	"go.mongodb.org/mongo-driver/mongo"
)

const facebookAuthType = "facebook"

type facebookTokenValidation struct {
	IsValid string `json:"is_valid"`
	UserID  string `json:"user_id"`
}

type facebookProfileData struct {
	FirstName string `json:"first_name"`
	LastName  string `json:"last_name"`
	Email     string `json:"email"`
}

// LoginFacebook create facebook auth / login
func LoginFacebook(ctx context.Context, token string) (*model.MutationRes, error) {
	validateTokenRequest := utils.HTTPClient.R()
	validateTokenRequest.QueryParam.Add("input_token", token)
	validateTokenRequest.QueryParam.Add("access_token", env.FacebookAppToken)
	validateTokenResponse, err := validateTokenRequest.Get("https://graph.facebook.com/debug_token")
	if err != nil {
		return nil, err
	}
	var validTokenData facebookTokenValidation
	if err = json.Unmarshal(validateTokenResponse.Body(), &validTokenData); err != nil {
		return nil, err
	}
	getProfileDataRequest := utils.HTTPClient.R().SetPathParams(map[string]string{
		"user-id": validTokenData.UserID,
	})
	getProfileDataRequest.QueryParam.Add("fields", strings.Join([]string{
		"first_name",
		"last_name",
		"email",
	}, ","))
	getProfileDataRequest.QueryParam.Add("access_token", token)
	getProfileDataResponse, err := getProfileDataRequest.Get("https://graph.facebook.com/{user-id}")
	if err != nil {
		return nil, err
	}
	var profileData facebookProfileData
	if err = json.Unmarshal(getProfileDataResponse.Body(), &profileData); err != nil {
		return nil, err
	}
	// now token is valid
	// check if user exists already
	var user model.User
	var foundUser bool
	if err := db.UserCollection.FindOne(db.CTXMongo, bson.M{
		"email": profileData.Email,
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
		fullName := profileData.FirstName + " " + profileData.LastName
		user, err = db.CreateUser(profileData.Email, fullName, facebookAuthType, "", true)
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
