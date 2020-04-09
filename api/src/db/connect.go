package db

import (
	"context"
	"errors"
	"os"
	"time"

	"go.mongodb.org/mongo-driver/mongo"
	"go.mongodb.org/mongo-driver/mongo/options"
)

// Client database client
var Client *mongo.Client

// CTXMongo mongo context
var CTXMongo context.Context

// DBName database name
var DBName string

const userCollectionName = "users"

// UserCollection collection of users
var UserCollection *mongo.Collection

// InitializeDB create connection to database
func InitializeDB() error {
	if DBName = os.Getenv("DB_NAME"); len(DBName) == 0 {
		return errors.New("no db name provided")
	}
	dbURI := os.Getenv("DB_URI")
	if len(dbURI) == 0 {
		return errors.New("no db connection uri provided")
	}
	var cancel context.CancelFunc
	CTXMongo, cancel = context.WithTimeout(context.Background(), 10*time.Second)
	defer cancel()
	var err error
	Client, err = mongo.Connect(CTXMongo, options.Client().ApplyURI(dbURI))
	if err != nil {
		return err
	}
	return nil
}
