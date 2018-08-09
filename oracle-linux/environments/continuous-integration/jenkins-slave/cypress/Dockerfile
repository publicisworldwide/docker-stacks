FROM cypress/base:10
RUN npm install cypress@3.0.3
ENV PATH "$PATH:/node_modules/.bin"
RUN cypress verify
VOLUME ["/cypress"]
WORKDIR "/cypress"
