FROM node:14.6.0-alpine3.10

RUN apk add docker-cli

RUN apk add git

RUN apk add python make g++

RUN apk add --no-cache python py-pip

RUN pip install awscli

RUN apk add --no-cache bash

RUN apk --no-cache add curl

RUN apk add --no-cache jq