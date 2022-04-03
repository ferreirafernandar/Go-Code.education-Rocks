#@version 3.7.5
FROM golang:1.7.3 AS builder

WORKDIR /go/src/
COPY ./src ./desafio

WORKDIR /go/src/desafio

RUN go get -v ./...  \
    && go build

CMD ["desafio"]

FROM scratch as prod

COPY --from=builder /go/src/desafio/desafio .

CMD ["/desafio"]