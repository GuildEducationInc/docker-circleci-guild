FROM circleci/python:3.8.6

ENV PATH="/home/circleci/.local/bin:${PATH}"
ENV CC_TEST_REPORTER_VERSION=0.6.2
RUN curl -L https://codeclimate.com/downloads/test-reporter/test-reporter-${CC_TEST_REPORTER_VERSION}-linux-amd64 > ~/cc-test-reporter && \
    chmod +x ~/cc-test-reporter && \
    sudo mv ~/cc-test-reporter /usr/local/bin/cc-test-reporter && \
    sudo apt-get update && \
    curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash - && \
    sudo apt-get install -y nodejs && \
    sudo curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64-2.0.52.zip" -o "awscliv2.zip" && \
    sudo unzip awscliv2.zip && \
    sudo ./aws/install && \
    sudo pip install --upgrade pip && \
    pip install -U --user pytest==5.0.1 && \
    pip install -U --user boto3==1.15.8 && \
    pip install -U --user aws-sam-cli==1.4.0 && \
    pip install -U --user psycopg2-binary==2.8.4 && \
    pip install -U --user Faker==4.1.1 && \
    echo "Installing CDK" && \
    sudo npm install -g aws-cdk && \
    pip install -U --user aws-cdk.core && \
    pip install -U --user aws-cdk.aws_apigatewayv2 && \
    pip install -U --user aws-cdk.aws_appsync && \
    pip install -U --user aws-cdk.aws_ec2 && \
    pip install -U --user aws-cdk.aws-events-targets \
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
    pip install -U --user aws-cdk.aws_ssm && \
    sudo rm -rf /var/lib/apt/lists/*
