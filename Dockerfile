FROM ubuntu:20.04
MAINTAINER BiomeHub
ENV DEBIAN_FRONTEND noninteractive



LABEL version="2.11"
LABEL software.version="2.11"
LABEL software="pandaseq"


RUN apt-get -y update && \
    apt-get -y upgrade && \
    apt-get -y install build-essential libtool automake zlib1g-dev libbz2-dev pkg-config && \
    apt-get -y install python3 && \
    apt-get -y install bash && \
    apt-get -y install git

RUN git clone https://github.com/neufeld/pandaseq.git && \
    cd pandaseq && \
    ./autogen.sh && ./configure && make && make install && \
    ldconfig