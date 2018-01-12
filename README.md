# Docker CircleCI Guild

This repository holds Docker images intended to be used in CI. The images are modified from the base Docker images with additional tooling for Guild's CI usage

## Image Types

### Ruby

This image is the [base ruby image](https://hub.docker.com/_/ruby/) with the addition of the [CodeClimate Test Reporter]() installed into `/usr/local/bin`

### Node

This image is the [base node image](https://hub.docker.com/_/node/) with the addition of the [CodeClimate Test Reporter]() installed into `/usr/local/bin`

### Rails

The Rails images are based on the ruby image above. In addition to ruby, node is installed alongside the image. The node version is the second half of the tag. For example, a tag of `2.4.2-9.4.0` would be ruby v2.4.2 and node v9.4.0

Like the official node images, Yarn is also installed into the image. The `NODE_VERSION` and `YARN_VERSION` environment variables are exposed within the image with these versions.

In addition to node, Google Chrome stable and chromedriver are installed. This is to facilitate Capybara/Selenium/System tests

## Adding New Versions

Modify the `versions.json` file and add the new version of whichever language you need to modify. In the case of node, also add a mapping for the appropriate version of yarn to be installed.

From there, run `update.sh`. New Dockerfiles will be generated. Check all of these into source control. You'll then need to go into the Docker Hub settings for the appropriate repositories (ruby, node, rails) and update the autobuild settings for the new Dockerfile locations/tags
