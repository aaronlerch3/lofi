package db

import (
	"github.com/aaronlerch3/lofi/api/graph/model"
	"go.mongodb.org/mongo-driver/bson"
	"go.mongodb.org/mongo-driver/bson/primitive"
)

// DefaultUserType general user
const DefaultUserType = "user"

// DefaultPlan default payment plan
const DefaultPlan = "free"

// CheckUserExists check if user exists in db by email
func CheckUserExists(email string) (bool, error) {
	numUsers, err := UserCollection.CountDocuments(CTXMongo, &bson.M{
		"email": email,
	})
	if err != nil {
		return false, err
	}
	return numUsers > 0, nil
}

// CreateUser create user with given params
func CreateUser(email string, name string, authType string, hashedPassword string, emailVerified bool) (model.User, error) {
	var passwordInput *string = nil
	if len(hashedPassword) > 0 {
		passwordInput = &hashedPassword
	}
	user := model.User{
		Name:               name,
		UserType:           DefaultUserType,
		CurrentPlan:        DefaultPlan,
		AuthType:           authType,
		Email:              email,
		EmailVerified:      emailVerified,
		Pages:              []string{},
		Recognition:        []string{},
		Password:           passwordInput,
		Location:           nil,
		Tracks:             []string{},
		Tickets:            []string{},
		Forums:             []string{},
		DirectMessageUsers: []string{},
		DiscussionThreads:  []string{},
		FollowingBands:     []string{},
		FollowingUsers:     []string{},
		CountFollowing:     0,
		Reviews:            []string{},
		Purchases:          []string{},
		Donations:          []string{},
		Points: &model.Points{
			Total:        0,
			Signup:       0,
			Track:        0,
			Recognition:  0,
			JoinBand:     0,
			Ticket:       0,
			Merch:        0,
			Donate:       0,
			ForumMessage: 0,
			Review:       0,
		},
	}
	insertRes, err := UserCollection.InsertOne(CTXMongo, user)
	if err != nil {
		return model.User{}, err
	}
	user.ID = insertRes.InsertedID.(primitive.ObjectID).Hex()
	return user, nil
}
