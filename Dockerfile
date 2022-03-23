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

RUN ./setup-requirements.sh
RUN ./install-bbld.sh

WORKDIR /root
