# @todo apache härten
FROM publicisworldwide/oracle-core:latest
MAINTAINER Publicis Worldwide

USER root

RUN yum install -y httpd  && \
    yum clean all

RUN rm -rf /var/www && \
    mkdir -p /var/www/html && \
    rm -rf /usr/share/httpd
#    && rm -f /etc/httpd/conf.d/* \
#    && rm -f /etc/httpd/conf.modules.d/* \
#ADD etc/httpd/conf/httpd.conf /etc/httpd/conf/

EXPOSE 80
EXPOSE 443

ADD run-httpd.sh /usr/local/bin/
RUN chmod -v +x /usr/local/bin/run-httpd.sh
CMD ["run-httpd.sh"]
