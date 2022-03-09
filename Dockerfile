FROM golang:1-alpine as build
WORKDIR /app
COPY go/producer/main.go /app
RUN go build go/producer/main.go
COPY go/consumer/main.go /app
RUN go build go/consumer/main.go
FROM alpine:latest
WORKDIR /app
COPY --from=build /app /app
EXPOSE 8180
ENTRYPOINT ["./service"]