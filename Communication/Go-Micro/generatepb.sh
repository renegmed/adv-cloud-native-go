#!/bin/bash

protoc proto/greeter.proto --go_out=plugins=grpc:.

protoc -I .  proto/greeter.proto \
--go_out=plugins=micro:${GOPATH}/src/lreimer-adv-cloud-native-go/Communication/Go-Micro