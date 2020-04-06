package utils

import (
	"go.uber.org/zap"
	"go.uber.org/zap/zapcore"
)

// Logger  logger object
var Logger *zap.Logger

// GenerateLogger create logger object
func GenerateLogger() error {
	var zapLoggerLevel zapcore.Level
	if IsDebug() {
		zapLoggerLevel = zapcore.DebugLevel
	} else {
		zapLoggerLevel = zapcore.InfoLevel
	}
	zapconfig := zap.Config{
		Level:            zap.NewAtomicLevelAt(zapLoggerLevel),
		Encoding:         "json",
		OutputPaths:      []string{"stdout"},
		ErrorOutputPaths: []string{"stderr"},
		InitialFields:    map[string]interface{}{},
		EncoderConfig: zapcore.EncoderConfig{
			MessageKey:  "message",
			LevelKey:    "level",
			EncodeLevel: zapcore.LowercaseLevelEncoder,
		},
	}
	var err error
	Logger, err = zapconfig.Build()
	if err != nil {
		return err
	}
	defer Logger.Sync()
	Logger.Info("logger created")
	return nil
}
