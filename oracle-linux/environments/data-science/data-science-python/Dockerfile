# standard python 2.7.x environment
FROM publicisworldwide/python-conda

MAINTAINER Publicis Worldwide

USER root

# install needed packages
RUN yum install -y \
    sudo && \
    yum clean all

USER $CONTAINER_USER

# modify home directory
RUN mkdir /home/$CONTAINER_USER/work && \
    mkdir /home/$CONTAINER_USER/.jupyter && \
    mkdir /home/$CONTAINER_USER/.local

# Install Python 2 packages and kernel spec
RUN conda install --yes \
    'ipython=4.0*' \
    'ipywidgets=4.0*' \
    'pandas=0.17*' \
    'matplotlib=1.4*' \
    'scipy=0.16*' \
    'seaborn=0.6*' \
    'scikit-learn=0.16*' \
    'notebook=4.1*' \
    terminado \
    pyzmq \
    && conda clean -yt

USER root

# configure container startup as root
EXPOSE 8888
WORKDIR /home/$CONTAINER_USER/work

ENV TINI_VERSION v0.9.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN echo "faafbfb5b079303691a939a747d7f60591f2143164093727e870b289a44d9872 *tini" | sha256sum -c - && \
    chmod +x /tini
ENTRYPOINT ["/tini", "--"]

CMD ["/usr/local/bin/start-jupyter.sh"]
# adding local files
COPY start-jupyter.sh /usr/local/bin/
COPY jupyter_notebook_config.py /home/$CONTAINER_USER/.jupyter/
RUN chown -R $CONTAINER_USER:users /home/$CONTAINER_USER/.jupyter

USER $CONTAINER_USER
