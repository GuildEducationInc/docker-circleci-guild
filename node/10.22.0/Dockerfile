FROM node:10.22.0
LABEL maintainer "Guild Engineering <engineering@guildeducation.com>"

ENV CC_TEST_REPORTER_VERSION=0.7.0
RUN curl -L https://codeclimate.com/downloads/test-reporter/test-reporter-${CC_TEST_REPORTER_VERSION}-linux-amd64 > /usr/local/bin/cc-test-reporter && \
    chmod +x /usr/local/bin/cc-test-reporter
