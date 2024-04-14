FROM golang:1.19-alpine AS builder

WORKDIR /app

COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build -ldflags="-s -w" -o desafio main.go

FROM scratch

COPY --from=builder /app/desafio /

CMD ["/desafio"]
