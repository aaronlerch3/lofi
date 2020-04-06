package db

import (
	"errors"
	"os"

	"github.com/aaronlerch3/lofi/api/utils"
	"github.com/aws/aws-sdk-go/aws"
	"github.com/aws/aws-sdk-go/service/dynamodb"
)

// Client database client
var Client *dynamodb.DynamoDB

// DBName database name
var DBName string

// InitializeDB create connection to database
func InitializeDB() error {
	if DBName = os.Getenv("DB_NAME"); len(DBName) == 0 {
		return errors.New("no db name provided")
	}
	Client = dynamodb.New(utils.AWSSession)
	if utils.IsDebug() {
		utils.Logger.Info("db api version: " + Client.APIVersion)
	}
	foundTable, err := checkTableExists()
	if err != nil {
		return err
	}
	reInitializeTable := os.Getenv("REINITIALIZE_TABLE") == "true"
	if foundTable {
		if reInitializeTable {
			if err := deleteTable(); err != nil {
				return err
			}
			if err := createTable(); err != nil {
				return err
			}
		}
	} else {
		if err := createTable(); err != nil {
			return err
		}
	}
	return nil
}

func createTable() error {
	if utils.IsDebug() {
		utils.Logger.Info("creating table...")
	}
	// data types: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/DynamoDBMapper.DataTypes.html
	input := &dynamodb.CreateTableInput{
		AttributeDefinitions: []*dynamodb.AttributeDefinition{
			{
				AttributeName: aws.String("Year"),
				AttributeType: aws.String("N"),
			},
			{
				AttributeName: aws.String("Title"),
				AttributeType: aws.String("S"),
			},
		},
		KeySchema: []*dynamodb.KeySchemaElement{
			{
				AttributeName: aws.String("Year"),
				KeyType:       aws.String("HASH"),
			},
			{
				AttributeName: aws.String("Title"),
				KeyType:       aws.String("RANGE"),
			},
		},
		ProvisionedThroughput: &dynamodb.ProvisionedThroughput{
			ReadCapacityUnits:  aws.Int64(10),
			WriteCapacityUnits: aws.Int64(10),
		},
		TableName: aws.String(DBName),
	}
	if _, err := Client.CreateTable(input); err != nil {
		return err
	}
	if err := Client.WaitUntilTableExists(&dynamodb.DescribeTableInput{
		TableName: aws.String(DBName),
	}); err != nil {
		return err
	}
	if utils.IsDebug() {
		utils.Logger.Info("table " + DBName + " created")
	}
	return nil
}

func deleteTable() error {
	if utils.IsDebug() {
		utils.Logger.Info("deleting old table...")
	}
	if _, err := Client.DeleteTable(&dynamodb.DeleteTableInput{
		TableName: aws.String(DBName),
	}); err != nil {
		return err
	}
	if err := Client.WaitUntilTableNotExists(&dynamodb.DescribeTableInput{
		TableName: aws.String(DBName),
	}); err != nil {
		return err
	}
	if utils.IsDebug() {
		utils.Logger.Info("old table deleted")
	}
	return nil
}

func checkTableExists() (bool, error) {
	if utils.IsDebug() {
		utils.Logger.Info("checking if table " + DBName + " exists...")
	}
	input := &dynamodb.ListTablesInput{}
	for {
		// Get the list of tables
		result, err := Client.ListTables(input)
		if err != nil {
			return false, err
		}
		for _, n := range result.TableNames {
			if *n == DBName {
				if utils.IsDebug() {
					utils.Logger.Info("table exists")
				}
				return true, nil
			}
		}
		// multiple calls to the ListTables function to retrieve all table names
		input.ExclusiveStartTableName = result.LastEvaluatedTableName
		if result.LastEvaluatedTableName == nil {
			break
		}
	}
	utils.Logger.Info("table does not exist")
	return false, nil
}
