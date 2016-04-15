# standard python 2.7.x environment
FROM publicisworldwide/oracle-core

MAINTAINER Publicis Worldwide

USER root

# configure environment
ENV CONDA_DIR /opt/conda
ENV PATH $CONDA_DIR/bin:$PATH
ENV CONTAINER_USER lion
ENV CONTAINER_UID 1000
ENV INSTALLER Miniconda2-latest-Linux-x86_64.sh

# create conda directory for lion user
RUN mkdir -p /opt/conda && \
    chown lion /opt/conda

USER $CONTAINER_USER

# install conda with python 2.7
RUN cd /tmp && \
    mkdir -p $CONDA_DIR && \
    wget https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh && \
    echo $(wget --quiet -O - https://repo.continuum.io/miniconda/ \
       | grep -A3 $INSTALLER \
       | tail -n1 \
       | cut -d\> -f2 \
       | cut -d\< -f1 ) $INSTALLER | md5sum -c - && \
    /bin/bash $INSTALLER -f -b -p $CONDA_DIR && \
    rm $INSTALLER