package db

import (
	"context"
	"time"

	"github.com/aaronlerch3/lofi/api/env"
	"go.mongodb.org/mongo-driver/mongo"
	"go.mongodb.org/mongo-driver/mongo/options"
)

// Client database client
var Client *mongo.Client

// CTXMongo mongo context
var CTXMongo context.Context

const userCollectionName = "users"

// UserCollection collection of users
var UserCollection *mongo.Collection

// InitializeDB create connection to database
func InitializeDB() error {
	var cancel context.CancelFunc
	CTXMongo, cancel = context.WithTimeout(context.Background(), 10*time.Second)
	defer cancel()
	var err error
	Client, err = mongo.Connect(CTXMongo, options.Client().ApplyURI(env.DBURI))
	if err != nil {
		return err
	}
	UserCollection = Client.Database(env.DBName).Collection(userCollectionName)
	return nil
}
