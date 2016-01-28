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

# install conda with python 3.5
RUN cd /tmp && \
    mkdir -p $CONDA_DIR && \
    wget --quiet https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
    echo "b834b525d3f42add8f2af0153d13f498 *Miniconda3-latest-Linux-x86_64.sh" | md5sum -c - && \
    /bin/bash Miniconda3-latest-Linux-x86_64.sh -f -b -p $CONDA_DIR && \
    rm Miniconda3-latest-Linux-x86_64.sh


