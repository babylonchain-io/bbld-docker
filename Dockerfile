FROM --platform=linux/amd64 debian:stable

RUN apt -yqq update && apt -yqq upgrade && apt install -yqq wget git make

# create a directory to store the setup scripts
RUN mkdir -p /setup-scripts
COPY ./setup-scripts /setup-scripts

# installation of requirements and bbld
WORKDIR /setup-scripts
RUN ./install-requirements.sh
RUN ./install-bbld.sh

WORKDIR /root
