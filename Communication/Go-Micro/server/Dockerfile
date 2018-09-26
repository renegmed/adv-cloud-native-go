FROM golang:1.9.1-alpine as builder

RUN apk update && apk upgrade && apk add --no-cache bash git

WORKDIR /go/src/lreimer-adv-cloud-native-go/Communication/Go-Micro/server

COPY . . 
 
RUN go get -u github.com/micro/micro && \
    go get github.com/micro/protobuf/proto && \
    go get -u github.com/micro/protobuf/protoc-gen-go

RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo .


FROM alpine:latest

# Security related package, good to have.
RUN apk --no-cache add ca-certificates 

RUN mkdir /app 

WORKDIR /app 

COPY --from=builder /go/src/lreimer-adv-cloud-native-go/Communication/Go-Micro/server/server . 
 
# ENV CONSUL_HTTP_ADDR localhost:8500

CMD ["./server"]
