# xdebug
# https://www.enalean.com/en/Deploy-%20PHP-app-Docker-Nginx-FPM-CentOSSCL
FROM publicisworldwide/httpd:latest
MAINTAINER Publicis Worldwide

USER root

RUN yum -y update && yum clean all
RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm
RUN yum install -y \
    php70w-fpm
RUN yum clean all

ADD config/* /etc/httpd/conf.modules.d/

ADD run-php.sh /usr/local/bin/
RUN chmod -v +x /usr/local/bin/run-php.sh
CMD ["run-php.sh"]
