FROM node:18-alpine

WORKDIR /highlightjs/

RUN apk add git

ARG HIGHLIGHT_JS_VERSION=11.9.0

RUN git clone --depth 1 --branch ${HIGHLIGHT_JS_VERSION} https://github.com/highlightjs/highlight.js.git
RUN cd highlight.js && npm ci

WORKDIR /highlightjs/sclang/
COPY package.json .
COPY package-lock.json .
RUN npm ci

WORKDIR /highlightjs/highlight.js

COPY build_docker.sh .

CMD [ "/bin/sh", "-c", "./build_docker.sh" ]
