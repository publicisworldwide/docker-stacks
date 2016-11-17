FROM publicisworldwide/jenkins-slave
MAINTAINER publicisworldwide heichblatt
ENV mvn_version 3.2.5
ENV mvn_tmp_file /tmp/apache-maven-${mvn_version}-bin.tar.gz
ENV java_version 7u79
ENV local_rpm /tmp/oracle-jdk.rpm

RUN /bin/yum install -y wget which tar && \
    /bin/yum clean all

RUN /bin/wget http://archive.apache.org/dist/maven/maven-3/${mvn_version}/binaries/apache-maven-${mvn_version}-bin.tar.gz -O ${mvn_tmp_file} && \
    tar -xvzf ${mvn_tmp_file} -C /opt && \
    ln -s /opt/apache-maven-${mvn_version}/bin/mvn /bin/mvn && \
    rm -fv ${mvn_tmp_file}

RUN /bin/yum reinstall -y filesystem && \
    /bin/rpm -qa | grep openjdk | /bin/grep openjdk | /bin/xargs /bin/yum remove -y && \
    /bin/wget --output-document=${local_rpm} --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/${java_version}-b15/jdk-${java_version}-linux-x64.rpm && \
    /bin/yum localinstall -y ${local_rpm} && \
    /bin/yum clean all && \
    rm -vf ${local_rpm}