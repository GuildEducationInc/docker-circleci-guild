FROM circleci/python:3.6.9

ENV PATH="/home/circleci/.local/bin:${PATH}"
ENV CC_TEST_REPORTER_VERSION=0.6.2
RUN curl -L https://codeclimate.com/downloads/test-reporter/test-reporter-${CC_TEST_REPORTER_VERSION}-linux-amd64 > ~/cc-test-reporter && \
    chmod +x ~/cc-test-reporter && \
    sudo mv ~/cc-test-reporter /usr/local/bin/cc-test-reporter && \
    sudo apt-get install nodejs && \
    sudo apt-get install npm && \
    pip install -U --user pytest==5.0.1 && \
    pip install -U --user boto3==1.15.36 && \
    pip install -U --user awscli==1.18.36 && \
    pip install -U --user aws-sam-cli==0.47.0 && \
    pip install -U --user pyscopg2-binary==2.8.4 && \
    echo "Installing CDK" && \
    sudo npm install -g aws-cdk && \
    pip install -U --user aws-cdk.core && \
    pip install -U --user aws-cdk.aws_apigatewayv2 && \
    pip install -U --user aws-cdk.aws_appsync && \
    pip install -U --user aws-cdk.aws_ec2 && \
    pip install -U --user aws-cdk.aws_lambda && \
    pip install -U --user aws-cdk.aws_lambda_event_sources && \
    pip install -U --user aws-cdk.aws_logs && \
    pip install -U --user aws-cdk.aws_iam && \
    pip install -U --user aws-cdk.aws_kinesis && \
    pip install -U --user aws-cdk.aws_kinesisfirehose && \
    pip install -U --user aws-cdk.aws_rds && \
    pip install -U --user aws-cdk.aws_s3 && \
    pip install -U --user aws-cdk.aws_secretsmanager && \
    pip install -U --user aws-cdk.aws_sns && \
    pip install -U --user aws-cdk.aws_sqs && \
    pip install -U --user aws-cdk.aws_ssm
