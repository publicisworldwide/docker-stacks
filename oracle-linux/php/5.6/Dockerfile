# @todo xdebug
FROM publicisworldwide/httpd:latest
MAINTAINER Publicis Worldwide

USER root

ENV PHP_VERSION 56

RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && \
    yum install -y https://mirror.webtatic.com/yum/el7/webtatic-release.rpm && \
    yum install -y \
        php${PHP_VERSION}w \
        php${PHP_VERSION}w-cli \
        php${PHP_VERSION}w-common && \
    yum clean all
