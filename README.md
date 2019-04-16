# Docker CircleCI Guild

This repository holds Docker images intended to be used in CI. The images are modified from the base Docker images with additional tooling for Guild's CI usage

# Prereqs:

- `jq` - `brew install jq`
- `docker` - https://www.docker.com/

## Image Types

### Ruby

This image is the [base ruby image](https://hub.docker.com/_/ruby/) with the addition of the [CodeClimate Test Reporter]() installed into `/usr/local/bin`

### Node

This image is the [base node image](https://hub.docker.com/_/node/) with the addition of the [CodeClimate Test Reporter]() installed into `/usr/local/bin`

### Node Lambda

THis image is based on the Guild Node 8.10.0 image (see above) with `aws-cli`, `awssam`, and `python` installed to facilitate deployments

### Rails

The Rails images are based on the ruby image above. In addition to ruby, node is installed alongside the image. The node version is the second half of the tag. For example, a tag of `2.4.2-9.4.0` would be ruby v2.4.2 and node v9.4.0

Like the official node images, Yarn is also installed into the image. The `NODE_VERSION` and `YARN_VERSION` environment variables are exposed within the image with these versions.

In addition to node, Google Chrome stable and chromedriver are installed. This is to facilitate Capybara/Selenium/System tests

## Local Development

Make whatever changes you need to make and then run `bin/update.sh` to generate the new `Dockerfile`. From there, a typical build command would be:

```bash
docker build <path/to/dockerfile> -t <username>/<image_name>:<tag_name>
# for example
docker build node/8.10.0 -t bobson_dugnutt/node:8.10.0
```

You can rebuild the image as often as you want. For more details on Docker and usage, please refer to the Docker [docs](https://docs.docker.com/get-started/part2/)

## Adding New Versions

Modify the `versions.json` file and add the new version of whichever language you need to modify. In the case of node, also add a mapping for the appropriate version of yarn to be installed.

From there, run `bin/update.sh`. New Dockerfiles will be generated. Check all of these into source control. You'll then need to go into the Docker Hub settings for the appropriate repositories (ruby, node, rails) and update the autobuild settings for the new Dockerfile locations/tags

## Releasing New Versions

CircleCI will build and publish (with the correct tags) the Docker containers when a PR is merged into `master`

`bin/build.sh` and `bin/publish.sh` are designed to only be run locally
