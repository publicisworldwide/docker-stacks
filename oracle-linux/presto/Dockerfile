FROM publicisworldwide/oracle-core

MAINTAINER Publicis Worldwide

USER root

RUN /bin/yum install -y \
    java-1.8.0-openjdk-headless && \
    yum clean all

EXPOSE 44444

USER $CONTAINER_USER

RUN mkdir /home/$CONTAINER_USER/.presto
RUN mkdir /tmp/presto-data

ENV PRESTO_VERSION 0.146

RUN cd /tmp \
	&& wget https://repo1.maven.org/maven2/com/facebook/presto/presto-server/${PRESTO_VERSION}/presto-server-${PRESTO_VERSION}.tar.gz \
	&& tar -xf presto-server-${PRESTO_VERSION}.tar.gz -C /home/$CONTAINER_USER/.presto \
	&& rm presto-server-${PRESTO_VERSION}.tar.gz

WORKDIR /home/$CONTAINER_USER/.presto/presto-server-${PRESTO_VERSION}

RUN mkdir ./etc 
COPY ./etc/* ./etc/
USER root
RUN chown -R $CONTAINER_USER ./etc

USER $CONTAINER_USER
ADD ./entrypoint.sh ./entrypoint.sh
ENTRYPOINT ["./entrypoint.sh"]