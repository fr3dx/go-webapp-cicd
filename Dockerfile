FROM golang:1.12.0-alpine3.9

RUN mkdir /app

ADD main.go /app

WORKDIR /app

RUN go build -o main .

FROM alpine

WORKDIR /app

COPY --from=builder /app/ /app/

CMD ["/app/main"]