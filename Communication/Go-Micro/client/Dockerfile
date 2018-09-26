FROM golang:1.9.1-alpine as builder

RUN apk update && apk upgrade && apk add --no-cache bash git


WORKDIR /go/src/lreimer-adv-cloud-native-go/Communication/Go-Micro/client

COPY . . 

RUN go get -u github.com/micro/micro && \
    go get github.com/micro/protobuf/proto && \
    go get -u github.com/micro/protobuf/protoc-gen-go && \
    go get github.com/micro/go-plugins/wrapper/breaker/hystrix && \
    go get github.com/afex/hystrix-go/hystrix

RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo .



FROM alpine:latest

# Security related package, good to have.
RUN apk --no-cache add ca-certificates 

RUN mkdir /app 

WORKDIR /app 

COPY --from=builder /go/src/lreimer-adv-cloud-native-go/Communication/Go-Micro/client/client . 
 
#ENV CONSUL_HTTP_ADDR localhost:8500

CMD ["./client"]

 
