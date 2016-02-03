FROM ubuntu:trusty
MAINTAINER Takahiro Shizuki <shizu@futuregadget.com>

ENV HOME /root

# Install dependencies
RUN sed -i.bak -e "s%http://archive.ubuntu.com/ubuntu/%http://ftp.iij.ad.jp/pub/linux/ubuntu/archive/%g" /etc/apt/sources.list
RUN apt-get update -o Acquire::ForceIPv4=true
RUN apt-get install -y bzip2 man psmisc vim wget
RUN apt-get clean


# OpenGL env
env LIBGL_ALWAYS_INDIRECT 1
#env DRI_PRIME 1

WORKDIR /root

# Install Blender dependencies
RUN apt-get install -y xterm libglu1-mesa mesa-utils `apt-cache depends blender| grep -v blender | grep " Depends" | awk '{print $2}' | grep -v \< | tr '\n' ' '`
RUN apt-get clean


# Setup Blender
RUN wget http://mirror.cs.umn.edu/blender.org/release/Blender2.76/blender-2.76b-linux-glibc211-x86_64.tar.bz2
RUN tar xvfp blender-2.76b-linux-glibc211-x86_64.tar.bz2
RUN mv blender-2.76b-linux-glibc211-x86_64 blender

WORKDIR /root
