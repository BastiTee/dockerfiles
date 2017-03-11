FROM ubuntu:16.04
LABEL version="1.0"
LABEL description="Docker image containing a German texlive environment."
LABEL maintainer="basti.tee@gmx.de"

# Required packages
RUN apt-get update
RUN apt-get -y install \
    texlive texlive-lang-german

RUN mkdir /workdir
WORKDIR /workdir
