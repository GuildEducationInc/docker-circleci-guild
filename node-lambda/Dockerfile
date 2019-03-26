# This is pinned to match the AWS Lambda node 8.10 runtime, see: https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html
FROM guildeducation/node:8.10.0

ENV DOCKERIZE_VERSION v0.3.0
# sed command is workaround for https://github.com/debuerreotype/docker-debian-artifacts/issues/66
RUN sed -i '/jessie-updates/d' /etc/apt/sources.list && \
    wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz && \
    tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz && \
    rm dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz && \
    apt-get -y -qq update && \
    apt-get -y install zip && \
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
    python get-pip.py && \
    apt-get -y install python-dev && \
    pip install awscli==1.16.36 --upgrade --user && \
    pip install aws-sam-cli==0.6.0 && \
    rm -rf /var/lib/apt/lists/*
