package main

import (
	"context"
	"encoding/json"
	"log/slog"

	amqp "github.com/rabbitmq/amqp091-go"
	"github.com/thenriquedb/imersao-fullcycle-17/payments/internal/entity"
	"github.com/thenriquedb/imersao-fullcycle-17/payments/pkg/rabbitmq"
)

// {"order_id": string, "card_hash": string, "total": number }
func main() {
	ctx := context.Background()
	ch, err := rabbitmq.OpenChannel()
	if err != nil {
		panic(err)
	}

	defer ch.Close()
	msgs := make(chan amqp.Delivery)
	go rabbitmq.Consume(ch, msgs, "orders")

	for msg := range msgs {
		var orderRequest entity.OrderRequest
		err := json.Unmarshal(msg.Body, &orderRequest)

		if err != nil {
			slog.Error(err.Error())
			break
		}

		response, err := orderRequest.Process()
		if err != nil {
			slog.Error(err.Error())
			break
		}

		responseJSON, err := json.Marshal(response)
		slog.Info(string(responseJSON))
		if err != nil {
			slog.Error(err.Error())
			break
		}

		err = rabbitmq.Publish(ctx, ch, string(responseJSON), "amq.direct")
		if err != nil {
			slog.Error(err.Error())
			break
		}

		msg.Ack(false)
		slog.Info("Order processed")
	}
}
