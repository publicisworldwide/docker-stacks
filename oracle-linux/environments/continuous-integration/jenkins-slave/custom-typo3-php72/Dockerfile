FROM publicisworldwide/jenkins-slave
MAINTAINER "Heiko Hardt" <heiko.hardt@publicispixelpark.de>

ENV container docker
ENV SYSTEMCTL_SKIP_REDIRECT foo


##########################################################################
## publicis standard setup

RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm \
        bzip2 \
        unzip \
        git \
        wget \
        java-1.8.0-openjdk \
    yum clean all

RUN mkdir -pv /jenkins


##########################################################################
## build tools

# Setup Nodejs
RUN yum install -y nodejs npm && \
    npm install -g grunt-cli && \
    npm install -g karma-cli && \
    yum clean all

# Setup compass
RUN yum-config-manager --enable ol7_optional_latest && \
    yum clean all && \
    yum install -y ruby ruby-devel gcc make && \
    gem install json_pure && \
    gem install rb-inotify -v=0.9 && \
    gem install compass && \
    yum clean all


##########################################################################
## acceptance test tools

# Setup (dev) - tools
RUN yum install -y tree make which curl GraphicsMagick ghostscript gtk3 xorg-x11-server-Xvfb && \
    yum clean all

# Acceptance user
RUN adduser screener

##########################################################################
## web environment

# Install apache + mariadb
RUN yum install -y httpd  mariadb-server mariadb && \
    yum clean all

# Prepare behat document root
RUN mkdir -p /var/www/behat && \
    chown apache:apache /var/www/behat && \
    chmod 2777 /var/www/behat

COPY /conf.files/etc/httpd/conf.d/* /etc/httpd/conf.d/

# Setup php
RUN yum install -y http://rpms.famillecollet.com/enterprise/remi-release-7.rpm && \
    yum install -y yum-utils && \
    yum-config-manager --enable remi-php72 && \
    yum install -y php php-mysql php-gd php-opcache php-mbstring php-xdebug && \
    yum clean all

COPY /conf.files/etc/php.d/* /etc/php.d/

# Setup composer
RUN yum install -y composer && \
    yum clean all

# Prepare environment
RUN mkdir -p /jenkins.workspace/dir-project && \
    mkdir -p /jenkins.workspace/dir-ci && \
    mkdir -p /jenkins.workspace/dir-architecture && \
    mkdir -p /jenkins.workspace/dir-tools && \
    chmod -R 777 /jenkins.workspace


##########################################################################
## init scripts

ENV SERVICES "mariadb httpd"

COPY /conf.files/etc/init.d/* /etc/init.d/
RUN for i in ${SERVICES} ; do chmod -v +x /etc/init.d/"$i" ; done
ADD ./entrypoint.sh /entrypoint.sh
RUN chmod -v u+x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
