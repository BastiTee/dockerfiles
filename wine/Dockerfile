FROM ubuntu:16.04
LABEL version="1.0"
LABEL description="Wine-i386 environment with Xserver support."
LABEL maintainer="basti.tee@posteo.de"

ENV DEBIAN_FRONTEND noninteractive
RUN dpkg --add-architecture i386
RUN apt-get clean \
    && apt-get update \
    && apt-get dist-upgrade -y \
    && apt-get install -y wine

RUN mkdir /workdir
WORKDIR /workdir
