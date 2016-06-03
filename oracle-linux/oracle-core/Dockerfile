# core for all projects running on Oracle Linux
FROM oraclelinux:7

MAINTAINER Publicis Worldwide

USER root

# configure environment
ENV CONTAINER_USER lion
ENV CONTAINER_UID 1000

# create lion user with UID=1000
RUN /sbin/useradd -m -s /bin/bash -N -u $CONTAINER_UID $CONTAINER_USER

RUN ( /bin/yum install -y yum-plugin-ovl || /bin/yum install -y yum-plugin-ovl ) && \
    /bin/yum clean all

# install standard packages
RUN /bin/yum install -y \
    wget \
    bzip2 \
    unzip \
    tar \
    sudo && \
    yum clean all

# allow passwordless sudo for user lion
RUN echo $CONTAINER_USER' ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# run container as lion
USER $CONTAINER_UID
