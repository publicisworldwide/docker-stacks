# standard python 2.7.x environment
FROM publicisworldwide/oracle-core

MAINTAINER Publicis Worldwide

USER root

# configure environment
ENV CONDA_DIR /opt/conda
ENV PATH $CONDA_DIR/bin:$PATH
ENV CONTAINER_USER lion
ENV CONTAINER_UID 1000

# create conda directory for lion user
RUN mkdir -p /opt/conda && \
    chown lion /opt/conda

USER $CONTAINER_USER

# install conda with python 2.7
RUN cd /tmp && \
    mkdir -p $CONDA_DIR && \
    wget --quiet https://repo.continuum.io/miniconda/Miniconda-latest-Linux-x86_64.sh && \
    echo $(wget --quiet -O - https://repo.continuum.io/miniconda/ \
       | grep -A3 "Miniconda-latest-Linux-x86_64.sh" \
       | tail -n1 \
       | cut -d\> -f2 \
       | cut -d\< -f1 ) "Miniconda-latest-Linux-x86_64.sh" | md5sum -c - && \
    /bin/bash Miniconda-latest-Linux-x86_64.sh -f -b -p $CONDA_DIR && \
    rm Miniconda-latest-Linux-x86_64.sh
