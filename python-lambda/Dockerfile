FROM circleci/python:3.6.9

ENV CC_TEST_REPORTER_VERSION=0.6.2
RUN curl -L https://codeclimate.com/downloads/test-reporter/test-reporter-${CC_TEST_REPORTER_VERSION}-linux-amd64 > ~/cc-test-reporter && \
    chmod +x ~/cc-test-reporter && \
    sudo mv ~/cc-test-reporter /usr/local/bin/cc-test-reporter && \
    export PATH=~/.local/bin/:$PATH && \
    pip install -U --user pytest==5.0.1 && \
    pip install -U --user boto3==1.9.192 && \
    pip install -U --user awscli==1.16.202 && \
    pip install -U --user aws-sam-cli==0.18.0
