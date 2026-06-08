FROM golang:1.24-alpine AS builder

WORKDIR /app

COPY main.go .

RUN CGO_ENABLED=0 GOOS=linux go build -o hello-app main.go

# Runtime Stage
FROM alpine:3.22

WORKDIR /app

COPY --from=builder /app/hello-app .

EXPOSE 8080
CMD ["./hello-app"]
