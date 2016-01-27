# core for all projects running on Oracle Linux
FROM oraclelinux:7

MAINTAINER Publicis Worldwide

USER root

# configure environment
ENV CON_USER lion
ENV CON_UID 1000

# create lion user with UID=1000
RUN useradd -m -s /bin/bash -N -u $CON_UID $CON_USER

# install standard packages
RUN yum install -y \
    tmux \
    vim && \
    yum clean all

# run container as lion
USER lion