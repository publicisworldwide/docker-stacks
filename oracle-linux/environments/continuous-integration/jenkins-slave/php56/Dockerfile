FROM publicisworldwide/jenkins-slave
MAINTAINER publicisworldwide heichblatt

RUN /usr/bin/yum install -y wget which tar yum-utils && \
    /usr/bin/yum clean all
# Install and enable Remi-Release
RUN yum install -y http://rpms.famillecollet.com/enterprise/remi-release-7.rpm
RUN yum-config-manager --enable remi-php56
# Install php
RUN /usr/bin/yum install -y php-common php-cli && \
    /usr/bin/yum clean all
# Install composer
RUN /bin/wget https://getcomposer.org/composer.phar -O /usr/local/bin/composer && /bin/chmod 0555 /usr/local/bin/composer
