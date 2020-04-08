package auth

import (
	"os"

	"github.com/aaronlerch3/lofi/api/utils"
	"github.com/aws/aws-sdk-go/aws"
	cognito "github.com/aws/aws-sdk-go/service/cognitoidentityprovider"
)

// CognitoClient holds data for auth flow
type CognitoClient struct {
	CognitoClient *cognito.CognitoIdentityProvider
	UserPoolID    *string
	AppClientID   *string
}

// Client auth client
var Client *CognitoClient

var AuthName = "asdf"

var ClientName = "test123"

// InitializeAuth initializes cognito
func InitializeAuth() error {
	client := cognito.New(utils.AWSSession)
	Client = &CognitoClient{
		CognitoClient: client,
	}
	foundAuth, poolID, err := checkAuthExists()
	if err != nil {
		return err
	}
	reInitializeAuth := os.Getenv("REINITIALIZE_AUTH") == "true"
	if foundAuth && reInitializeAuth {
		if err := deleteAuth(poolID); err != nil {
			return err
		}
	}
	var AppClientID *string
	if !foundAuth || reInitializeAuth {
		poolID, err = createAuth()
		if err != nil {
			return err
		}
		AppClientID, err = createAuthClient(poolID)
		if err != nil {
			return err
		}
	} else {
		var clientExists bool
		clientExists, AppClientID, err = checkAuthClientExists(poolID)
		if err != nil {
			return err
		}
		if !clientExists {
			AppClientID, err = createAuthClient(poolID)
			if err != nil {
				return err
			}
		}
	}
	Client.UserPoolID = poolID
	Client.AppClientID = AppClientID
	return nil
}

func createAuth() (*string, error) {
	if utils.IsDebug() {
		utils.Logger.Info("creating auth...")
	}
	input := &cognito.CreateUserPoolInput{
		PoolName: aws.String(AuthName),
		UsernameAttributes: []*string{
			aws.String("email"),
		},
		AutoVerifiedAttributes: []*string{
			aws.String("email"),
		},
		Policies: &cognito.UserPoolPolicyType{
			PasswordPolicy: &cognito.PasswordPolicyType{
				MinimumLength:                 aws.Int64(8),
				RequireLowercase:              aws.Bool(true),
				RequireUppercase:              aws.Bool(true),
				RequireSymbols:                aws.Bool(false),
				TemporaryPasswordValidityDays: aws.Int64(10),
			},
		},
	}
	createPoolOutput, err := Client.CognitoClient.CreateUserPool(input)
	if err != nil {
		return nil, err
	}
	if utils.IsDebug() {
		utils.Logger.Info("auth " + AuthName + " created")
	}
	return createPoolOutput.UserPool.Id, nil
}

func checkAuthExists() (bool, *string, error) {
	if utils.IsDebug() {
		utils.Logger.Info("checking if auth " + AuthName + " exists...")
	}
	input := &cognito.ListUserPoolsInput{
		MaxResults: aws.Int64(60),
	}
	for {
		// Get the list of tables
		result, err := Client.CognitoClient.ListUserPools(input)
		if err != nil {
			return false, nil, err
		}
		for _, pool := range result.UserPools {
			if *pool.Name == AuthName {
				if utils.IsDebug() {
					utils.Logger.Info("auth exists")
				}
				return true, pool.Id, nil
			}
		}
		if result.NextToken == nil {
			break
		}
		input.SetNextToken(*input.NextToken)
	}
	return false, nil, nil
}

func deleteAuth(poolID *string) error {
	if utils.IsDebug() {
		utils.Logger.Info("deleting old auth...")
	}
	if _, err := Client.CognitoClient.DeleteUserPool(&cognito.DeleteUserPoolInput{
		UserPoolId: poolID,
	}); err != nil {
		return err
	}
	if utils.IsDebug() {
		utils.Logger.Info("old auth deleted")
	}
	return nil
}

func checkAuthClientExists(poolID *string) (bool, *string, error) {
	if utils.IsDebug() {
		utils.Logger.Info("checking if auth client " + ClientName + " exists...")
	}
	input := &cognito.ListUserPoolClientsInput{
		UserPoolId: poolID,
	}
	for {
		// Get the list of tables
		result, err := Client.CognitoClient.ListUserPoolClients(input)
		if err != nil {
			return false, nil, err
		}
		for _, pool := range result.UserPoolClients {
			if *pool.ClientName == ClientName {
				if utils.IsDebug() {
					utils.Logger.Info("auth client exists")
				}
				return true, pool.ClientId, nil
			}
		}
		if result.NextToken == nil {
			break
		}
		input.SetNextToken(*input.NextToken)
	}
	utils.Logger.Info("auth client does not exist")
	return false, nil, nil
}

func createAuthClient(poolID *string) (*string, error) {
	if utils.IsDebug() {
		utils.Logger.Info("creating auth client...")
	}
	input := &cognito.CreateUserPoolClientInput{
		UserPoolId: poolID,
		ClientName: aws.String(ClientName),
		ExplicitAuthFlows: []*string{
			aws.String("ALLOW_USER_PASSWORD_AUTH"),
			aws.String("ALLOW_REFRESH_TOKEN_AUTH"),
		},
		GenerateSecret:       aws.Bool(false),
		RefreshTokenValidity: aws.Int64(30),
		ReadAttributes: []*string{
			aws.String("name"),
			aws.String("email"),
		},
	}
	clientCreateRes, err := Client.CognitoClient.CreateUserPoolClient(input)
	if err != nil {
		return nil, err
	}
	if utils.IsDebug() {
		utils.Logger.Info("auth " + ClientName + " created")
	}
	return clientCreateRes.UserPoolClient.ClientId, nil
}

func deleteAuthClient(poolID *string, clientID *string) error {
	if utils.IsDebug() {
		utils.Logger.Info("deleting old auth client...")
	}
	if _, err := Client.CognitoClient.DeleteUserPoolClient(&cognito.DeleteUserPoolClientInput{
		UserPoolId: poolID,
		ClientId:   clientID,
	}); err != nil {
		return err
	}
	if utils.IsDebug() {
		utils.Logger.Info("old auth client deleted")
	}
	return nil
}
