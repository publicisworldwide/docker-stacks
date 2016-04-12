FROM publicisworldwide/jenkins-slave
MAINTAINER publicisworldwide heichblatt
ENV mvn_version 3.2.5
ENV mvn_tmp_file /tmp/apache-maven-${mvn_version}-bin.tar.gz
ENV node_version v4.4.2
ENV ijpeg_version 9b

RUN /usr/bin/yum install -y wget which tar && \
    /usr/bin/yum clean all

RUN /bin/wget http://archive.apache.org/dist/maven/maven-3/${mvn_version}/binaries/apache-maven-${mvn_version}-bin.tar.gz -O ${mvn_tmp_file} && \
    tar -xvzf ${mvn_tmp_file} -C /opt && \
    ln -s /opt/apache-maven-${mvn_version}/bin/mvn /usr/bin/mvn && \
    rm -fv ${mvn_tmp_file}

RUN /usr/bin/yum install -y java-1.8.0-openjdk-devel java-1.8.0-openjdk-headless && \
    /usr/bin/yum clean all

RUN /bin/wget -P /opt https://nodejs.org/dist/${node_version}/node-${node_version}-linux-x64.tar.xz && \
    /bin/tar -xvf /opt/node-${node_version}-linux-x64.tar.xz  -C /opt && \
    /bin/ln -s /opt/node-${node_version}-linux-x64/bin/node /usr/bin/node && \
    /bin/ln -s /opt/node-${node_version}-linux-x64/bin/npm /usr/bin/npm

RUN /usr/bin/yum install -y libpng-devel && \
    /bin/wget -P /usr/src http://www.ijg.org/files/jpegsrc.v${ijpeg_version}.tar.gz && \
    cd /usr/src && \
    /bin/tar xfv jpegsrc.v${ijpeg_version}.tar.gz && \
    cd jpeg-${ijpeg_version} && \
    ./configure --prefix=/usr --libdir=/usr/lib64 && \
    /bin/make && \
    /bin/make install
