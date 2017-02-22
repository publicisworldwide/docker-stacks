FROM publicisworldwide/jenkins-slave
MAINTAINER publicisworldwide heichblatt
ENV mvn_version 3.2.5
ENV mvn_tmp_file /tmp/apache-maven-${mvn_version}-bin.tar.gz
ENV jdk_tmp_file /tmp/jdk.rpm

RUN /usr/bin/yum install -y wget which tar && \
    /usr/bin/yum clean all

RUN /bin/wget http://archive.apache.org/dist/maven/maven-3/${mvn_version}/binaries/apache-maven-${mvn_version}-bin.tar.gz -O ${mvn_tmp_file} && \
    tar -xvzf ${mvn_tmp_file} -C /opt && \
    ln -s /opt/apache-maven-${mvn_version}/bin/mvn /usr/bin/mvn && \
    rm -fv ${mvn_tmp_file}

# http://tecadmin.net/install-java-8-on-centos-rhel-and-fedora/
RUN /usr/bin/yum remove -y "*openjdk*" && \
/bin/wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" -v "http://download.oracle.com/otn-pub/java/jdk/8u91-b14/jdk-8u91-linux-x64.rpm" -O ${jdk_tmp_file} && \
    /usr/bin/yum install -y ${jdk_tmp_file} && \
    rm -fv ${jdk_tmp_file} && \
    /usr/bin/yum clean all