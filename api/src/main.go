package main

import (
	"github.com/aaronlerch3/lofi/api/auth"
	"github.com/aaronlerch3/lofi/api/db"
	"github.com/aaronlerch3/lofi/api/server"
	"github.com/aaronlerch3/lofi/api/utils"
	dotenv "github.com/joho/godotenv"
)

func init() {
	if err := dotenv.Load(); err != nil {
		panic("Error loading .env file")
	}
	utils.SetMode()
	if err := utils.GenerateLogger(); err != nil {
		panic(err)
	}
	if err := db.InitializeDB(); err != nil {
		utils.Logger.Fatal(err.Error())
	}
	utils.InitializeCleanupHandler()
	if err := auth.InitializeAuth(); err != nil {
		utils.Logger.Fatal(err.Error())
	}
}

func main() {
	if err := server.StartServer(); err != nil {
		utils.Logger.Fatal(err.Error())
	}
}
