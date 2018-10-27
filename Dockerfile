# FROM golang
FROM golang:1.11.1-stretch

# Set timezone to Asia/Tokyo
ENV TZ /usr/share/zoneinfo/Asia/Tokyo

RUN apt-get update \
  && apt-get install --no-install-recommends \
  -y build-essential git curl wget zlib1g-dev libxml2-dev libxslt1-dev openssl less libssl-dev libreadline-dev vim unzip mysql-client

# Install dlv for only development environment
RUN go get -u github.com/derekparker/delve/cmd/dlv

# Install consul
RUN go get github.com/hashicorp/consul
