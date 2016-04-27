FROM publicisworldwide/jenkins-slave:node44
MAINTAINER publicisworldwide heichblatt
ENV ijpeg_version 9b

RUN /usr/bin/yum install -y libpng-devel && \
    /bin/wget -P /usr/src http://www.ijg.org/files/jpegsrc.v${ijpeg_version}.tar.gz && \
    cd /usr/src && \
    /bin/tar xfv jpegsrc.v${ijpeg_version}.tar.gz && \
    cd jpeg-${ijpeg_version} && \
    ./configure && \
    /bin/make && \
    /bin/make install