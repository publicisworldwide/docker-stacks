# xdebug
# https://www.enalean.com/en/Deploy-%20PHP-app-Docker-Nginx-FPM-CentOSSCL
FROM publicisworldwide/httpd:latest
MAINTAINER Publicis Worldwide

USER root

RUN yum clean all
RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && \
    yum install -y https://mirror.webtatic.com/yum/el7/webtatic-release.rpm && \
    yum install -y php70w-fpm && \
    yum clean all

ADD config/* /etc/httpd/conf.modules.d/
ADD run-php.sh /usr/local/bin/

EXPOSE 9000

CMD ["/usr/local/bin/run-php.sh"]
