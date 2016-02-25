FROM publicisworldwide/mesos-base
MAINTAINER publicisworldwide heichblatt

ENV SPARK_TARBALL spark-1.5.1-bin-hadoop2.6.tgz
ENV SPARK_URL http://d3kbcqa49mib13.cloudfront.net/${SPARK_TARBALL}
ENV SPARK_BASE /opt/spark
ENV SPARK_HOME ${SPARK_BASE}/spark-1.5.1-bin-hadoop2.6

RUN yum install -y java-1.7.0-openjdk tar && \
    yum clean all
RUN /usr/bin/mkdir -pv ${SPARK_BASE}
RUN /usr/bin/curl --output ${SPARK_BASE}/${SPARK_TARBALL} ${SPARK_URL} && \
    /usr/bin/tar xf ${SPARK_BASE}/${SPARK_TARBALL} -C ${SPARK_BASE} && \
    /usr/bin/rm -v ${SPARK_BASE}/${SPARK_TARBALL}
