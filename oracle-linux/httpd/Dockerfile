#wie parametrisiert man einen container, z.b. MaxClients?
FROM publicisworldwide/oracle-core:latest
MAINTAINER Publicis Worldwide

USER root

RUN yum -y update && yum clean all
RUN yum install -y \
    httpd
RUN yum clean all

RUN rm -rf /var/www
RUN rm -f /etc/httpd/conf.d/*
RUN mkdir -p /var/www/html

ADD config/httpd.conf /etc/httpd/conf/
ADD run-httpd.sh /usr/local/bin/
RUN chmod -v +x /usr/local/bin/run-httpd.sh

EXPOSE 80
CMD ["run-httpd.sh"]
