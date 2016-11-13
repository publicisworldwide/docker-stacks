FROM oraclelinux:7
MAINTAINER "Heiko Hardt" <heiko.hardt@publicispixelpark.de>

##########################################################################
# changes for using systemd base image(s)
# please check:
#       https://hub.docker.com/_/centos/
#       chapter "Dockerfile for systemd base image"
# for detailed informations

ENV container docker

RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
    rm -f /lib/systemd/system/multi-user.target.wants/*;\
    rm -f /etc/systemd/system/*.wants/*;\
    rm -f /lib/systemd/system/local-fs.target.wants/*; \
    rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
    rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
    rm -f /lib/systemd/system/basic.target.wants/*;\
    rm -f /lib/systemd/system/anaconda.target.wants/*;

VOLUME ["/sys/fs/cgroup", "/tmp", "/run", "/run/lock"]


##########################################################################
## publicis standard setup

RUN yum clean all && \
    yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && \
    yum clean all

RUN yum install -y java-1.7.0-openjdk \
      git \
      wget \
      pv \
      yum-plugin-ovl && \
    yum clean all

RUN yum group install -y "Development Tools" && \
    yum clean all

RUN mkdir -pv /jenkins


##########################################################################
## build tools

# Setup Nodejs
RUN yum install -y nodejs npm && \
    npm install -g grunt-cli && \
    npm install -g karma-cli

# Setup compass
RUN yum-config-manager --enable ol7_optional_latest && \
    yum clean all && \
    yum install -y ruby ruby-devel gcc make && \
    gem install json_pure && \
    gem update --system && \
    gem install compass


##########################################################################
## acceptance test tools

# Setup (dev) - tools
RUN yum groupinstall -y "Development Tools" && \
    yum install -y tree make which curl GraphicsMagick ghostscript

# Phantomjs
RUN cd /opt && \
    wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2 && \
    tar xvjf phantomjs-2.1.1-linux-x86_64.tar.bz2 && \
    ln -s /opt/phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/local/bin && \
    chmod +x /usr/local/bin/phantomjs && \
    rm -Rf phantomjs-2.1.1-linux-x86_64.tar.bz2

# Prepare Selenium & Firefox headless environment
RUN adduser screener && \
    yum install -y links xorg-x11-server-Xvfb firefox dconf dconf-editor && \
    mkdir -p /opt/selenium-server && \
    cd /opt/selenium-server && \
    wget https://selenium-release.storage.googleapis.com/2.53/selenium-server-standalone-2.53.0.jar && \
    mkdir -p /var/log/selenium-server && \
    mkdir -p /var/log/phantomjs && \
    chown -R screener:screener /opt/selenium-server && \
    chown -R screener:screener /usr/local/bin/phantomjs && \
    chown -R screener:screener /var/log/selenium-server && \
    chown -R screener:screener /var/log/phantomjs

COPY /conf.files/etc/init.d/phantomjs /etc/init.d/
COPY /conf.files/etc/init.d/selenium /etc/init.d/
COPY /conf.files/etc/init.d/Xvfb /etc/init.d/

RUN chmod +x /etc/init.d/selenium && \
    chmod +x /etc/init.d/Xvfb && \
    chmod +x /etc/init.d/phantomjs


##########################################################################
## web environment

# Setup apache
RUN yum install -y httpd && \
    systemctl enable httpd.service

# Setup mysql
RUN yum install -y mariadb-server mariadb && \
    systemctl enable mariadb.service

# Setup php
RUN yum install -y http://rpms.famillecollet.com/enterprise/remi-release-7.rpm && \
    yum install -y yum-utils && \
    yum-config-manager --enable remi-php56 && \
    yum clean all && \
    yum install -y php php-mysql php-gd php-opcache php-mbstring php-xdebug

# Setup composer
RUN curl -sS https://getcomposer.org/installer | /usr/bin/php -- --install-dir=/usr/local/bin/ --filename=composer


CMD ["/usr/sbin/init"]
