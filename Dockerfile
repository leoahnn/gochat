FROM golang:alpine AS build
COPY . /src
WORKDIR /src
RUN CGO_ENABLED=0 GOOS=linux go build -a -ldflags '-s' cmd/ardilla/ardilla.go

FROM scratch AS production
WORKDIR /src
COPY --from=build /src .
ENTRYPOINT ["./ardilla"]
