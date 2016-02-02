FROM publicisworldwide/php:latest
MAINTAINER Publicis Worldwide

ENV TYPO3_VERSION 7.6.2

COPY config/php.ini /usr/local/etc/php/
RUN yum install -y \
    GraphicsMagick

RUN yum install -y \
    php-soap \
    php-mbstring \
    php-opcache \
    php-zip \
    php-gd

#RUN apt-get update -qq && apt-get install -y --no-install-recommends \
#    libxml2-dev \
#    libzip-dev \
#    libfreetype6-dev \
#    libjpeg62-turbo-dev \
#    libpng12-dev \
#    php5-mysqlnd \
#  && docker-php-ext-configure gd \
#    --with-freetype-dir=/usr/include/ \
#    --with-jpeg-dir=/usr/include \
#    --with-png-dir=/usr/include/ \
#  && docker-php-ext-install \
#    mysqli \
RUN mkdir -p /var/www/html \
    && cd /opt \
    && curl -L -o typo3_src.tgz get.typo3.org/${TYPO3_VERSION} \
    && tar zxf typo3_src.tgz \
    && cd /var/www/html \
    && ln -s /opt/typo3_src-${TYPO3_VERSION} typo3_src \
    && ln -s typo3_src/index.php index.php \
    && ln -s typo3_src/typo3 typo3 \
    && chown -R www-data:www-data /var/www
