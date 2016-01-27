# core for all projects running on Oracle Linux
FROM oraclelinux:7

MAINTAINER Publicis Worldwide

USER root

# configure environment
ENV CONTAINER_USER lion
ENV CONTAINER_UID 1000

# create lion user with UID=1000
RUN useradd -m -s /bin/bash -N -u $CONTAINER_UID $CONTAINER_USER

# install standard packages
RUN yum install -y \
    wget \
    tar && \
    yum clean all

# run container as lion
USER $CONTAINER_UID