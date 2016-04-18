# standard python 2.7.x environment
FROM publicisworldwide/python-conda

MAINTAINER Publicis Worldwide

USER root

# install needed packages
RUN yum install -y \
    sudo && \
    yum clean all


# mesos dependencies
RUN /usr/bin/yum install -y http://repos.mesosphere.io/el/7/noarch/RPMS/mesosphere-el-repo-7-1.noarch.rpm && \
    /usr/bin/yum clean all
RUN /usr/bin/yum install -y mesos && \
    /usr/bin/yum clean all

ENV MESOS_NATIVE_LIBRARY /usr/local/lib/libmesos.so

# spark dependencies
ENV SPARK_TARBALL spark-1.5.1-bin-hadoop2.6.tgz
ENV SPARK_URL http://d3kbcqa49mib13.cloudfront.net/${SPARK_TARBALL}
ENV SPARK_BASE /opt/spark
ENV SPARK_HOME ${SPARK_BASE}/spark-1.5.1-bin-hadoop2.6
ENV PYTHONPATH ${SPARK_HOME}/python:${SPARK_HOME}/python/lib/py4j-0.8.2.1-src.zip

RUN yum install -y java-1.7.0-openjdk tar && \
    yum clean all
RUN /usr/bin/mkdir -pv ${SPARK_BASE}
RUN /usr/bin/curl --output ${SPARK_BASE}/${SPARK_TARBALL} ${SPARK_URL} && \
    /usr/bin/tar xf ${SPARK_BASE}/${SPARK_TARBALL} -C ${SPARK_BASE} && \
    /usr/bin/rm -v ${SPARK_BASE}/${SPARK_TARBALL}

# sparkling water dependencies
ENV SPARKLING_ZIP sparkling-water-1.5.12.zip
ENV SPARKLING_URL http://h2o-release.s3.amazonaws.com/sparkling-water/rel-1.5/12/sparkling-water-1.5.12.zip
ENV SPARKLING_BASE /opt/sparkling-water
ENV SPARKLING_HOME $(SPARKLING_BASE)/sparkling-water-1.5.12

RUN /usr/bin/mkdir -pv ${SPARKLING_BASE}
RUN /usr/bin/curl --output ${SPARKLING_BASE}/${SPARKLING_ZIP} ${SPARKLING_URL} && \
    /usr/bin/unzip ${SPARKLING_BASE}/${SPARKLING_ZIP} -d ${SPARKLING_BASE} && \
    /usr/bin/rm -v ${SPARKLING_BASE}/${SPARKLING_ZIP}

USER $CONTAINER_USER

# modify home directory
RUN mkdir /home/$CONTAINER_USER/work && \
    mkdir /home/$CONTAINER_USER/.jupyter && \
    mkdir /home/$CONTAINER_USER/.local

# Install Python 2 packages and kernel spec
RUN conda install --yes \
    'ipython=4.0*' \
    'ipywidgets=4.0*' \
    'matplotlib=1.4*' \
    'seaborn=0.6*' \
    'notebook=4.1*' \
    future \
    terminado \
    pyzmq \
    && conda install --yes -c https://conda.anaconda.org/auto tabulate \
    && conda clean -yt

USER root

# configure container startup as root
EXPOSE 8888
WORKDIR /home/$CONTAINER_USER/work

ENV TINI_VERSION v0.9.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini
ENTRYPOINT ["/tini", "--"]

CMD ["/usr/local/bin/start-jupyter.sh"]
# adding local files
COPY start-jupyter.sh /usr/local/bin/
COPY jupyter_notebook_config.py /home/$CONTAINER_USER/.jupyter/
RUN chown -R $CONTAINER_USER:users /home/$CONTAINER_USER/.jupyter

USER $CONTAINER_USER
