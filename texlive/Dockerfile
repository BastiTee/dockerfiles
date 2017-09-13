FROM ubuntu:16.04
LABEL version="1.0"
LABEL description="German texlive environment."
LABEL maintainer="basti.tee@posteo.de"

# Required packages
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get -y install \
    texlive texlive-lang-german

RUN mkdir /workdir
WORKDIR /workdir
