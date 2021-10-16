# go言語 + beego

## 環境構築

1. `Dockerfile`・`docker-compose.yml`を作成する

```yml
version: '3'

services:
  golang:
    build: .
    ports:
      - "8080:8080"
    container_name: golang
    command: sh -c "cd app && bee run"
    volumes:
      - ./app:/go/src/github.com/app
```

```Dockerfile
FROM golang:latest

ENV SRC_DIR=/go/src/github.com/

WORKDIR $SRC_DIR

RUN go get github.com/beego/bee
RUN go get -u github.com/astaxie/beego
```

2. ビルドする
`docker-compose build`

3. beegoアプリを作成する
`docker-compose run golang bee api app`

4. モジュールをインストールする
`docker-compose run golang sh -c "cd app && go mod tidy"`

5. サーバーを起動する
`docker-compose up`
