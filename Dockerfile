FROM --platform=linux/amd64 debian:stable

RUN apt -yqq update && apt -yqq upgrade && apt install -yqq wget git make

# create a directory to store the setup scripts
RUN mkdir -p /setup-scripts
COPY ./setup-scripts /setup-scripts

# installation of requirements and bbld
WORKDIR /setup-scripts

# download Go-1.17.7
RUN wget https://go.dev/dl/go1.17.7.linux-amd64.tar.gz
RUN chmod +777 go1.17.7.linux-amd64.tar.gz
RUN tar -C /usr/local -xzf go1.17.7.linux-amd64.tar.gz
RUN ln -s /usr/local/go/bin/* /usr/bin/
RUN mkdir  /root/go
RUN mkdir  /root/go/src
RUN mkdir   /root/go/bin

ENV GOPATH  $HOME/go
ENV GOROOT  /usr/local/go
ENV GOBIN   $GOROOT/bin
ENV GOTOOLS $GOROOT/pkg/tool
ENV PATH    $PATH:$GOBIN:$GOTOOLS:$GOPATH

RUN ./install-bbld.sh

WORKDIR /root
