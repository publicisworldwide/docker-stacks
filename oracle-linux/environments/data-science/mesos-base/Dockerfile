FROM oraclelinux:7
MAINTAINER publicisworldwide

RUN /usr/bin/yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && \
    /usr/bin/yum-config-manager --enable ol7_optional_latest && \
    /usr/bin/yum install -y http://repos.mesosphere.io/el/7/noarch/RPMS/mesosphere-el-repo-7-1.noarch.rpm && \
    /usr/bin/yum clean all
RUN /usr/bin/yum install -y mesos && \
    /usr/bin/yum clean all
