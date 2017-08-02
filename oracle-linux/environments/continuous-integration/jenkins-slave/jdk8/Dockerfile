FROM publicisworldwide/jenkins-slave
MAINTAINER publicisworldwide heichblatt
ENV mvn_version 3.2.5
ENV mvn_tmp_file /tmp/apache-maven-${mvn_version}-bin.tar.gz

RUN /usr/bin/yum install -y wget which tar && \
    /usr/bin/yum clean all

RUN /bin/wget http://archive.apache.org/dist/maven/maven-3/${mvn_version}/binaries/apache-maven-${mvn_version}-bin.tar.gz -O ${mvn_tmp_file} && \
    tar -xvzf ${mvn_tmp_file} -C /opt && \
    ln -s /opt/apache-maven-${mvn_version}/bin/mvn /usr/bin/mvn && \
    rm -fv ${mvn_tmp_file}

RUN /usr/bin/yum install -y java-1.8.0-openjdk-devel && \
    /usr/bin/yum clean all
