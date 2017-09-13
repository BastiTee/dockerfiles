FROM ubuntu:16.04
LABEL version="1.0"
LABEL description="A minimal setup to test X11 forwarding from inside docker."
LABEL maintainer="basti.tee@posteo.de"

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get install -y x11-apps

ENTRYPOINT ["xeyes"]
