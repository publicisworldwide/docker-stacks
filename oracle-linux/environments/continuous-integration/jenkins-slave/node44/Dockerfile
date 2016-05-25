FROM publicisworldwide/jenkins-slave
MAINTAINER publicisworldwide heichblatt
ENV node_version v4.4.4

RUN /bin/wget -P /opt https://nodejs.org/dist/${node_version}/node-${node_version}-linux-x64.tar.xz && \
    /bin/tar -xvf /opt/node-${node_version}-linux-x64.tar.xz  -C /opt && \
    /bin/ln -s /opt/node-${node_version}-linux-x64/bin/node /usr/bin/node && \
    /bin/ln -s /opt/node-${node_version}-linux-x64/bin/npm /usr/bin/npm
