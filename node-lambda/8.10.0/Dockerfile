# This is pinned to match the AWS Lambda node 8.10 runtime, see: https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html
FROM guildeducation/node:8.10.0

ENV DOCKERIZE_VERSION v0.3.0
# sed command is workaround for https://github.com/debuerreotype/docker-debian-artifacts/issues/66
RUN sed -i '/jessie-updates/d' /etc/apt/sources.list && \
    wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz && \
    tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz && \
    rm dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz && \
    curl -LO https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.69.0/pact-1.69.0-linux-x86_64.tar.gz && \
    tar -C /usr/local/ -xzf pact-1.69.0-linux-x86_64.tar.gz && \
    rm pact-1.69.0-linux-x86_64.tar.gz && \
    apt-get -y -qq update && \
    apt-get -y install zip && \
    apt-get -y install jq && \
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
    python get-pip.py && \
    apt-get -y install python-dev && \
    pip install awscli==1.16.170 --upgrade --user && \
    pip install aws-sam-cli==0.16.0 && \
    rm -rf /var/lib/apt/lists/*