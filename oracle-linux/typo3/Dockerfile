FROM publicisworldwide/php:latest
MAINTAINER Publicis Worldwide

ENV TYPO3_VERSION 7.6.2

ADD etc/php.d/typo3.ini /etc/php.d/

RUN yum install -y tar && \
    yum install -y GraphicsMagick && \
    yum install -y php70w-gd && \
    yum install -y php70w-mysqlnd && \
    yum install -y php70w-soap && \
    yum clean all

RUN cd /opt && \
    curl -L -o typo3_src.tgz get.typo3.org/${TYPO3_VERSION} && \
    tar zxf /opt/typo3_src.tgz -C /opt && \
    rm -f /var/www/html/* && \
    cd /var/www/html && \
    ln -s /opt/typo3_src-${TYPO3_VERSION} typo3_src && \
    ln -s typo3_src/index.php index.php && \
    ln -s typo3_src/typo3 typo3 && \
    touch /var/www/html/FIRST_INSTALL && \
    chown -R apache:apache /var/www
