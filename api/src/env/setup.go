package env

import (
	"errors"
	"os"
)

const defaultPort = "8080"

// Mode current server mode
var Mode string

// Port port the server is connected to
var Port string

// DBName name of database
var DBName string

// DBURI connection uri to database
var DBURI string

// WebsiteURL url of associated website
var WebsiteURL string

// GoogleWebClientID web client id
var GoogleWebClientID string

// GoogleMobileClientID mobile client id
var GoogleMobileClientID string

// FacebookAppToken app token for facebook auth
var FacebookAppToken string

// TwitterKey key for twitter auth
var TwitterKey string

// TwitterSecret secret for twitter auth
var TwitterSecret string

// JWTIssuer jwt issuer
var JWTIssuer string

// InitializeEnvironment init env
func InitializeEnvironment() error {
	Mode = os.Getenv("MODE")
	Port = os.Getenv("PORT")
	if len(Port) == 0 {
		Port = defaultPort
	}
	if DBName = os.Getenv("DB_NAME"); len(DBName) == 0 {
		return errors.New("no db name provided")
	}
	DBURI = os.Getenv("DB_URI")
	if len(DBURI) == 0 {
		return errors.New("no db connection uri provided")
	}
	WebsiteURL = os.Getenv("WEBSITE_URL")
	if len(WebsiteURL) == 0 {
		return errors.New("cannot find website url")
	}
	GoogleWebClientID = os.Getenv("WEB_GOOGLE_CLIENT_ID")
	if len(GoogleWebClientID) == 0 {
		return errors.New("no google web client id found")
	}
	GoogleMobileClientID = os.Getenv("MOBILE_GOOGLE_CLIENT_ID")
	if len(GoogleMobileClientID) == 0 {
		return errors.New("no facebook mobile client id found")
	}
	FacebookAppToken = os.Getenv("FACEBOOK_APP_TOKEN")
	if len(FacebookAppToken) == 0 {
		return errors.New("no facebook app token found")
	}
	TwitterKey = os.Getenv("TWITTER_KEY")
	if len(TwitterKey) == 0 {
		return errors.New("no twitter key found")
	}
	TwitterSecret = os.Getenv("TWITTER_SECRET")
	if len(TwitterSecret) == 0 {
		return errors.New("no twitter secret found")
	}
	JWTIssuer = os.Getenv("JWT_ISSUER")
	if len(JWTIssuer) == 0 {
		return errors.New("no jwt issuer provided")
	}
	return nil
}
