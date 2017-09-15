FROM ubuntu:16.04
LABEL version="1.0"
LABEL description="Profanity XMPP-client compiled from HEAD against libmesode 0.9.1 and including profanity-omemo-plugin compile from HEAD."
LABEL maintainer="basti.tee@posteo.de"

# Setup basic environment
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y wget gcc automake autoconf autoconf-archive libtool pkg-config libncursesw5-dev libglib2.0-dev libcurl3-dev libreadline-dev libnotify-dev libxss-dev libotr5-dev libgpgme11-dev libgtk2.0-dev python-dev    libcmocka-dev libexpat-dev libssl-dev python-setuptools git libffi-dev unzip

# Download source code 
RUN wget https://github.com/boothj5/libmesode/archive/0.9.1.tar.gz
RUN tar -zxvf 0.9.1.tar.gz
RUN wget https://github.com/ReneVolution/profanity-omemo-plugin/archive/master.zip 
RUN unzip master.zip -d profanity-omemo-src
RUN git clone https://github.com/boothj5/profanity.git

# Compile and install libmesode 
WORKDIR /libmesode-0.9.1
RUN ./bootstrap.sh && ./configure && make && make install && ldconfig

# Compile and install profanity
WORKDIR /profanity
RUN ./bootstrap.sh
RUN ./configure --prefix=/usr --enable-notifications --enable-python-plugins --enable-c-plugins --enable-plugins --enable-otr --enable-pgp
RUN make && make install

# Compile and install profanity-omemo
WORKDIR /profanity-omemo-src/profanity-omemo-plugin-master/
RUN python setup.py install --force --user --prefix=
RUN mkdir -p ~/.local/share/profanity/plugins
RUN cp deploy/prof_omemo_plugin.py ~/.local/share/profanity/plugins/

# START
ENTRYPOINT profanity -l DEBUG
