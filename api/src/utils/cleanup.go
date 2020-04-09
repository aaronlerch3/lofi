package utils

import (
	"os"
	"os/signal"
	"syscall"

	"github.com/aaronlerch3/lofi/api/db"
)

// InitializeCleanupHandler creates handler for completed process
func InitializeCleanupHandler() {
	c := make(chan os.Signal, 2)
	signal.Notify(c, os.Interrupt, syscall.SIGTERM)
	go func() {
		<-c
		Logger.Info("closing gracefully...")
		if err := db.Client.Disconnect(db.CTXMongo); err != nil {
			Logger.Error("problem closing mongo connection: " + err.Error())
		}
		Logger.Info("done closing")
		os.Exit(0)
	}()
}
