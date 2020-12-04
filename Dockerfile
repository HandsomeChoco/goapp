FROM golang:1.11-alpine AS build
MAINTAINER handsomechoco <kkb931115@gmail.com>
LABEL 'purpose'='synchronized code and automated build between dockerhub and github'

WORKDIR /src/
COPY main.go go.* /src/
RUN CGO_ENABLED=0 go build -o /bin/demo

FROM scratch
COPY --from=build /bin/demo /bin/demo
ENTRYPOINT ["/bin/demo"]
