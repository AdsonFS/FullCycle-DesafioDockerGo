FROM golang:latest as builder

WORKDIR /go/src/app
COPY main.go .
COPY go.mod .
RUN go build -o main

FROM scratch
WORKDIR /usr/src/go
COPY --from=builder /go/src/app .

ENTRYPOINT [ "./main" ]