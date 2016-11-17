FROM publicisworldwide/jenkins-slave
MAINTAINER publicisworldwide heichblatt xmarkusx
ENV node_version v4.6.2

RUN /bin/wget -P /opt https://nodejs.org/dist/${node_version}/node-${node_version}-linux-x64.tar.xz && \
    /bin/tar -xvf /opt/node-${node_version}-linux-x64.tar.xz -C /usr/local/ --strip-components=1