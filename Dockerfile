FROM golang:1.20-alpine AS builder

WORKDIR /app

COPY . .

RUN go build -o /main main.go

FROM scratch

WORKDIR /app

COPY --from=builder /main /main

ENTRYPOINT ["/main"]
