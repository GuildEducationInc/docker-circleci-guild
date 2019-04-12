FROM node:$BASE_TAG
LABEL maintainer "Guild Engineering <engineering@guildeducation.com>"

ENV CC_TEST_REPORTER_VERSION=$CC_TEST_REPORTER_VERSION
RUN curl -L https://codeclimate.com/downloads/test-reporter/test-reporter-${CC_TEST_REPORTER_VERSION}-linux-amd64 > /usr/local/bin/cc-test-reporter && \
    chmod +x /usr/local/bin/cc-test-reporter
