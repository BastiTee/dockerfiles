FROM ubuntu:14.04
LABEL version="1.0"
LABEL description="Wine-i386 environment with Xserver support."
LABEL maintainer="basti.tee@gmx.de"

# Required packages
RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get install --no-install-recommends --assume-yes wine vim x11-apps

RUN mkdir /workdir
WORKDIR /workdir
