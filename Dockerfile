# syntax=docker/dockerfile:1
FROM golang:1.27.0 AS builder

WORKDIR /src

COPY ./go.mod ./go.sum .
RUN go mod download && \
    go mod verify

COPY . .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -mod=mod \
  -ldflags='-w -s -extldflags "-static"' -a \
  -o /main .

FROM scratch

COPY --from=builder /main .

ENTRYPOINT ["/main"]
