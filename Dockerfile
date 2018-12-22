# FROM golang
FROM golang:1.11.4-stretch

# Set timezone to Asia/Tokyo
ENV TZ /usr/share/zoneinfo/Asia/Tokyo

WORKDIR /opt

RUN apt-get update \
  && apt-get install --no-install-recommends \
  -y build-essential git curl wget zlib1g-dev libxml2-dev libxslt1-dev openssl less \
  libssl-dev libreadline-dev vim unzip mysql-client xvfb libfontconfig fontconfig libxrender-dev

# install wkhtmltopdf
RUN wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.4/wkhtmltox-0.12.4_linux-generic-amd64.tar.xz
RUN tar xvf wkhtmltox*.tar.xz && ln -s /opt/wkhtmltox/bin/wkhtmltopdf /usr/bin/wkhtmltopdf

# install IPAex Fonts
RUN mkdir ~/.fonts
RUN wget http://dl.ipafont.ipa.go.jp/IPAexfont/IPAexfont00301.zip
RUN unzip IPAexfont00301.zip && ln -s /opt/IPAexfont00301 ~/.fonts/IPAexfont00301
RUN fc-cache -fv

# Install dlv for only development environment
RUN go get -u github.com/derekparker/delve/cmd/dlv

# Install consul
RUN go get github.com/hashicorp/consul
