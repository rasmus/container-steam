FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Copenhagen
ENV LANG 'en_US.UTF-8'
ENV LANGUAGE 'en_US:en'

# Install requirements
RUN \
    echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections && \
    apt-get -y update && \
    apt-get install -y --no-install-recommends software-properties-common && \
    add-apt-repository multiverse && \
    dpkg --add-architecture i386 && \
    apt-get -y update && \
    apt-get -y upgrade && \
    apt-get -y install --no-install-recommends \
        ca-certificates \
        curl \
        gosu \
        htop \
        netcat \
        locales \
        net-tools \
        tzdata \
        wget \
        && \
    apt-get clean && \
    rm -rf /var/lib/{apt,dpkg,cache,log}/ && \
    locale-gen en_US.UTF-8

# Set time zone
RUN \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone

# Install Steam
RUN \
    echo steam steam/question select "I AGREE" | debconf-set-selections && \
    echo steam steam/license note '' | debconf-set-selections && \
    apt-get -y install --no-install-recommends \
        libgcc1 \
        lib32stdc++6 \
        libsdl2-2.0-0:i386 \
        steamcmd && \
    apt-get clean && \
    rm -rf /var/lib/{apt,dpkg,cache,log}/ && \
    ln -s /usr/games/steamcmd /usr/bin/steamcmd

# Setup Steam user
RUN \
    addgroup steam -gid 1000 && \
    adduser steam -uid 1000 -gid 1000 --disabled-password --gecos ""

USER steam

WORKDIR /home/steam

ENV USER steam
ENV HOME /home/steam
