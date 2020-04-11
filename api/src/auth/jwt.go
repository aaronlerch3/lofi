package auth

import (
	"time"

	"github.com/aaronlerch3/lofi/api/env"
	"github.com/dgrijalva/jwt-go"
)

type loginClaims struct {
	ID       string `json:"id"`
	Email    string `json:"email"`
	UserType string `json:"user_type"`
	Plan     string `json:"plan"`
	jwt.StandardClaims
}

// TokenExpirationTime time to expiration in hours
const TokenExpirationTime = 2

// GenerateJWT generate jwt access token
func GenerateJWT(userID string, userEmail string, userType string, userPlan string) (*jwt.Token, error) {
	expirationTime := time.Now().Add(time.Duration(TokenExpirationTime) * time.Hour)
	token := jwt.NewWithClaims(jwt.SigningMethodHS256, loginClaims{
		userID,
		userEmail,
		userType,
		userPlan,
		jwt.StandardClaims{
			ExpiresAt: expirationTime.Unix(),
			Issuer:    env.JWTIssuer,
		},
	})
	return token, nil
}
