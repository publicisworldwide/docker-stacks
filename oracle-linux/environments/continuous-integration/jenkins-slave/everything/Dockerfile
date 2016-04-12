FROM publicisworldwide/jenkins-slave:latest
MAINTAINER publicisworldwide heichblatt
ENV build_script /usr/bin/build.sh
RUN /usr/bin/yum -y install git && \
    yum clean all
WORKDIR /usr/src/docker-stacks
RUN /usr/bin/git clone https://github.com/publicisworldwide/docker-stacks.git .
RUN cd ./oracle-linux/environments/continuous-integration/jenkins-slave && \
    echo -e '#!/usr/bin/env bash'  > ${build_script} && \
    echo -e 'ENV() { export $1=$2 ; }' >> ${build_script} && \
    echo "WORKDIR() { mkdir -pv "\$1" && cd "\$1" ; }" >> ${build_script} && \
    for dockerfile in $(find . -iname "Dockerfile*" | grep -v everything | grep -v custom) ; do ( cat $dockerfile | sed 's/RUN//g' | grep -v MAINTAINER | grep -v FROM ; echo "cd /" ) >> ${build_script} ; done && \
    /usr/bin/chmod -v 700 ${build_script}
RUN /usr/bin/bash -xe ${build_script}