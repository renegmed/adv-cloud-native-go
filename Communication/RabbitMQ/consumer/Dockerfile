FROM golang:1.9.1-alpine

RUN apk update && apk upgrade && apk add --no-cache bash git

RUN go get github.com/streadway/amqp

ENV SOURCES /go/src/lreimer-adv-cloud-native-go/Communication/RabbitMQ/consumer
WORKDIR ${SOURCES}

COPY . .

RUN CGO_ENABLED=0 go build

ENV BROKER_ADDR amqp://guest:guest@localhost:5672/
 
CMD ["./consumer"]
