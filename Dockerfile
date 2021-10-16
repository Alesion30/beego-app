FROM golang:latest

ENV SRC_DIR=/go/src/github.com/

WORKDIR $SRC_DIR

RUN go get github.com/beego/bee
RUN go get -u github.com/astaxie/beego
