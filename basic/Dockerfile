FROM ubuntu:16.04
LABEL version="1.0"
LABEL description="A basic development environment."
LABEL maintainer="basti.tee@gmx.de"

ENV DEBIAN_FRONTEND noninteractive

# Update os environment
RUN \
apt-get update && \
apt-get upgrade -y && \
apt-get install -y apt-utils

# Install minimal app suite
RUN apt-get install -y vim git

# Obtain working environment from git
RUN mkdir /root/git
WORKDIR /root/git
RUN git clone https://github.com/BastiTee/bastis-bash-commons.git
RUN git clone https://github.com/BastiTee/bastis-ubersettings.git
RUN git clone https://github.com/BastiTee/dockerfiles.git

# Install working environment
RUN echo "source /root/git/bastis-bash-commons/bbc-bash-defaults" > /root/.bashrc
RUN echo "export PATH=${PATH}:/root/git/bastis-bash-commons:/root/git/dockerfiles" >> /root/.bashrc
WORKDIR /root/git/bastis-ubersettings/shell-rcs
RUN ./link.sh

# Done
WORKDIR /root
