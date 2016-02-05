# @todo xdebug
# @todo https://www.enalean.com/en/Deploy-%20PHP-app-Docker-Nginx-FPM-CentOSSCL
FROM publicisworldwide/httpd:latest
MAINTAINER Publicis Worldwide

USER root

RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && \
    yum install -y https://mirror.webtatic.com/yum/el7/webtatic-release.rpm && \
    yum install -y php70w \
        php70w-cli \
        php70w-common && \
    yum clean all

ADD content/* /var/www/html/
#ADD etc/httpd/conf.d/* /etc/httpd/conf.d/
#ADD etc/httpd/conf.modules.d/* /etc/httpd/conf.modules.d/
