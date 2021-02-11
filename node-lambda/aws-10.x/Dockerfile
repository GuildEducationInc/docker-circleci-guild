FROM amazon/lambda-build-node10.x:latest
LABEL maintainer "Guild Engineering <engineering@guildeducation.com>"

ENV CC_TEST_REPORTER_VERSION 0.7.0
ENV DOCKERIZE_VERSION v0.3.0
ENV TERRAFORM_VERSION 0.12.13
ENV AUTH0_PROVIDER_VERSION v0.4.2
ENV PATH "$PATH:/root/.local/bin:/root/.yarn/bin:/root/.config/yarn/global/node_modules/.bin"

RUN curl -L https://codeclimate.com/downloads/test-reporter/test-reporter-${CC_TEST_REPORTER_VERSION}-linux-amd64 > /usr/local/bin/cc-test-reporter && \
    chmod +x /usr/local/bin/cc-test-reporter

# install necessary utils not present in amazon linux
RUN yum -y -q update && \
    yum -y install tar zip unzip jq

# install dockerize
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz && \
    tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz && \
    rm dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz

# install pact
RUN curl -LO https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v1.69.0/pact-1.69.0-linux-x86_64.tar.gz && \
    tar -C /usr/local/ -xzf pact-1.69.0-linux-x86_64.tar.gz && \
    rm pact-1.69.0-linux-x86_64.tar.gz

# install terraform with auth0
RUN wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/local/bin && \
    rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    mkdir -m +x -p ~/.terraform.d/plugins && \
    wget https://github.com/alexkappa/terraform-provider-auth0/releases/download/${AUTH0_PROVIDER_VERSION}/terraform-provider-auth0_${AUTH0_PROVIDER_VERSION}_linux_amd64.tar.gz && \
    tar -C ~/.terraform.d/plugins -xzf terraform-provider-auth0_${AUTH0_PROVIDER_VERSION}_linux_amd64.tar.gz && \
    rm terraform-provider-auth0_${AUTH0_PROVIDER_VERSION}_linux_amd64.tar.gz

# install sam cli and yarn
RUN pip install awscli --upgrade && \
    pip install "aws-sam-cli>=1.0,<2.0" && \
    curl -o- -L https://yarnpkg.com/install.sh | bash && \
    rm -rf /var/lib/apt/lists/*
