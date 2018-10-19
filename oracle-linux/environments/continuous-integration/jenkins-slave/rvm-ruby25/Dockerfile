FROM publicisworldwide/jenkins-slave
MAINTAINER publicisworldwide heichblatt
RUN /usr/bin/yum install -y which tar
RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 && \
    \curl -sSL https://get.rvm.io | bash -s stable --ruby=2.5
