FROM ubuntu:16.04
LABEL version="1.0"
LABEL description="Profanity XMPP-client compiled from HEAD against libmesode 0.9.1 and including profanity-omemo-plugin compile from HEAD."
LABEL maintainer="basti.tee@posteo.de"

# BASIC DEVELOPMENT ENVIRONMENT -----------------------------------------------
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y wget gcc automake autoconf autoconf-archive libtool pkg-config libncursesw5-dev libglib2.0-dev libcurl3-dev libreadline-dev libnotify-dev libxss-dev libotr5-dev libgpgme11-dev libgtk2.0-dev python-dev    libcmocka-dev libexpat-dev libssl-dev python-setuptools git libffi-dev unzip vim
WORKDIR /

# LIBMESODE -------------------------------------------------------------------
RUN git clone https://github.com/boothj5/libmesode.git
WORKDIR /libmesode
# e3db0e9 = v0.9.1
RUN git checkout e3db0e9 
RUN ./bootstrap.sh && ./configure && make && make install && ldconfig

# PROFANITY -------------------------------------------------------------------
WORKDIR /
RUN git clone https://github.com/boothj5/profanity.git
WORKDIR /profanity 
RUN git checkout ca1dcdd
RUN ./bootstrap.sh  
RUN ./configure --prefix=/usr --enable-notifications --enable-python-plugins --enable-c-plugins --enable-plugins --enable-otr --enable-pgp
RUN make && make install

# PROFANITY OMEMO PLUGIN ------------------------------------------------------ 
WORKDIR /
RUN git clone https://github.com/ReneVolution/profanity-omemo-plugin.git
WORKDIR /profanity-omemo-plugin
RUN git checkout d2df00f
RUN python setup.py install --force --user --prefix=
RUN mkdir -p ~/.local/share/profanity/plugins
RUN cp deploy/prof_omemo_plugin.py ~/.local/share/profanity/plugins/

# START -----------------------------------------------------------------------
ENTRYPOINT profanity -l DEBUG
