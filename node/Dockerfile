FROM ubuntu:16.04
LABEL version="1.0"
LABEL description="Docker image containing a basic nodejs environment."
LABEL maintainer="basti.tee@posteo.de"

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get install -y apt-utils
RUN apt-get upgrade -y
RUN apt-get install -y nodejs nodejs-legacy npm x11-apps gtk3.0 libxss1 gconf2 libnss3 libcanberra-gtk-module
RUN mkdir /workdir
EXPOSE 50199
WORKDIR /workdir
