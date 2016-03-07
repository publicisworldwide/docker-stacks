FROM publicisworldwide/oracle-core
MAINTAINER publicisworldwide heichblatt

RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && \
    yum clean all
RUN yum install -y java-1.7.0-openjdk \
      git \
      wget \
      pv && \
    yum clean all
RUN yum group install -y "Development Tools" && \
    yum clean all
RUN mkdir -pv /jenkins
