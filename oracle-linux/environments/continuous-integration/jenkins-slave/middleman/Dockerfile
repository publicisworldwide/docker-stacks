FROM publicisworldwide/jenkins-slave
MAINTAINER publicisworldwide heichblatt

ENV node_version v6.0.0

RUN /usr/bin/yum install -y which tar yum-utils
RUN yum-config-manager --enable ol7_optional_latest
RUN /usr/bin/yum install -y libyaml-devel
RUN touch /var/lib/rpm/*
RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 && \
    curl -sSL https://get.rvm.io | bash -s -- --ruby=1.9.3 && \
    curl -sSL https://get.rvm.io | bash -s -- --ruby=2.2
RUN cd /usr/bin ; for i in /usr/local/rvm/wrappers/default/* ; do /usr/bin/ln -vfs "$i" ; done

RUN /bin/wget -P /opt https://nodejs.org/dist/${node_version}/node-${node_version}-linux-x64.tar.xz && \
    /bin/tar -xvf /opt/node-${node_version}-linux-x64.tar.xz  -C /opt && \
    /bin/ln -s /opt/node-${node_version}-linux-x64/bin/node /usr/bin/node && \
    /bin/ln -s /opt/node-${node_version}-linux-x64/bin/npm /usr/bin/npm
