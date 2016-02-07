# @todo: change user and group
FROM publicisworldwide/php:latest
MAINTAINER Publicis Worldwide

ADD etc/php.d/typo3.ini /etc/php.d/

ENV PHP_VERSION 56
RUN yum install -y tar && \
    yum install -y GraphicsMagick && \
    yum install -y \
        php${PHP_VERSION}w-gd \
        php${PHP_VERSION}w-mysqlnd \
        php${PHP_VERSION}w-pdo \
        php${PHP_VERSION}w-soap \
        php${PHP_VERSION}w-opcache \
        php${PHP_VERSION}w-mbstring \
        php${PHP_VERSION}w-xml && \
    yum clean all

ENV TYPO3_VERSION 7.6.2
RUN cd /opt && \
    curl -L -o typo3_src.tgz get.typo3.org/${TYPO3_VERSION} && \
    tar zxf /opt/typo3_src.tgz -C /opt && \
    rm /opt/typo3_src.tgz && \
    rm -f /var/www/html/* && \
    cd /var/www/html && \
    ln -s /opt/typo3_src-${TYPO3_VERSION} typo3_src && \
    ln -s typo3_src/index.php index.php && \
    ln -s typo3_src/typo3 typo3 && \
    chown -R apache:apache /var/www

