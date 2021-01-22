FROM circleci/python:3.8.6

RUN sudo adduser --disabled-password --gecos '' --uid 1001 cicd_user

ENV PATH="/home/circleci/.local/bin:${PATH}"
ENV CC_TEST_REPORTER_VERSION=0.6.2
RUN curl -L https://codeclimate.com/downloads/test-reporter/test-reporter-${CC_TEST_REPORTER_VERSION}-linux-amd64 > ~/cc-test-reporter && \
    chmod +x ~/cc-test-reporter && \
    sudo mv ~/cc-test-reporter /usr/local/bin/cc-test-reporter && \
    sudo apt-get update && \
    curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash - && \
    sudo apt-get install -y nodejs && \
    sudo curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64-2.1.21.zip" -o "awscliv2.zip" && \
    sudo unzip awscliv2.zip && \
    sudo ./aws/install && \
    sudo pip install --upgrade pip && \
    pip install -U pytest==5.0.1 && \
    pip install -U boto3==1.16.58 && \
    pip install -U aws-sam-cli==1.15.0 && \
    pip install -U psycopg2-binary==2.8.6 && \
    pip install -U Faker==4.1.1 && \
    pip install -U aws-xray-sdk==2.6.0 && \
    echo "Installing CDK" && \
    sudo npm install -g aws-cdk && \
    pip install -U aws-cdk.core && \
    pip install -U aws-cdk.aws_apigatewayv2 && \
    pip install -U aws-cdk.aws_appsync && \
    pip install -U aws-cdk.aws_ec2 && \
    pip install -U aws-cdk.aws-events-targets \
    pip install -U aws-cdk.aws_lambda && \
    pip install -U aws-cdk.aws_lambda_event_sources && \
    pip install -U aws-cdk.aws_logs && \
    pip install -U aws-cdk.aws_iam && \
    pip install -U aws-cdk.aws_kinesis && \
    pip install -U aws-cdk.aws_kinesisfirehose && \
    pip install -U aws-cdk.aws_rds && \
    pip install -U aws-cdk.aws_s3 && \
    pip install -U aws-cdk.aws_secretsmanager && \
    pip install -U aws-cdk.aws_sns && \
    pip install -U aws-cdk.aws_sqs && \
    pip install -U aws-cdk.aws_ssm && \
    sudo rm -rf /var/lib/apt/lists/*
