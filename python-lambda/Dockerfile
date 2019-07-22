# This is pinned to match the AWS Lambda node 8.10 runtime, see: https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html
FROM circleci/python:3.6.4

ENV CC_TEST_REPORTER_VERSION=0.6.2
RUN pip install -U --user pytest==5.0.1 && \
    pip install -U --user boto3==1.9.192 && \
    pip install -U --user awscli==1.16.202 && \
    pip install -U --user aws-sam-cli==0.18.0
