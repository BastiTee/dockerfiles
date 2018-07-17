FROM ubuntu:18.10
LABEL version="1.0"
LABEL description="A silly bash fireplace."
LABEL maintainer="basti.tee@posteo.de"

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get install -y libaa-bin

ENTRYPOINT ["aafire"]
