#!/bin/bash

function generateDockerfile {
  local type=$1
	shift
	local first_variant=$1
  local version=${first_variant}
	shift
  local second_variant=
  if [[ $# -eq 1 ]]; then
    second_variant=$1
    version="${first_variant}-${second_variant}"
    shift
  fi
  echo "Generating Dockerfile for ${type} ${version}"
  local version_dir="./${type}/${version}"
  mkdir -p ${version_dir}
  cp "Dockerfile-${type}.template" ${version_dir}/Dockerfile
  sed -E -i '' 's/\$BASE_TAG/'"${first_variant}"'/' ${version_dir}/Dockerfile
}

# Baseline
VERSIONS=`cat versions.json`
RUBY_VERSIONS=`echo ${VERSIONS} | jq -r '.ruby.versions[]'`
NODE_VERSIONS=`echo ${VERSIONS} | jq -r '.node.versions[]'`
CC_TEST_REPORTER_VERSION=`echo ${VERSIONS} | jq -r '.cc_test_reporter_version'`
CHROMEDRIVER_VERSION=`echo ${VERSIONS} | jq -r '.chromedriver_version'`

# Drop a Dockerfile for each Ruby version
mkdir -p ruby && rm -rf ruby/*
for version in ${RUBY_VERSIONS}; do
  generateDockerfile 'ruby' ${version}
  sed -E -i '' 's/\$CC_TEST_REPORTER_VERSION/'"${CC_TEST_REPORTER_VERSION}"'/' ruby/${version}/Dockerfile
done

# Drop a Dockerfile for each Node version
mkdir -p node && rm -rf node/*
for version in ${NODE_VERSIONS}; do
  generateDockerfile 'node' ${version}
  sed -E -i '' 's/\$CC_TEST_REPORTER_VERSION/'"${CC_TEST_REPORTER_VERSION}"'/' node/${version}/Dockerfile
done

# Drop a Dockerfile for each Ruby + Node version (eg Rails)
mkdir -p rails && rm -rf rails/*
for ruby_version in ${RUBY_VERSIONS}; do
  for node_version in ${NODE_VERSIONS}; do
    generateDockerfile 'rails' ${ruby_version} ${node_version}
    yarn_version=`echo ${VERSIONS} | jq -r ".node.yarn[\"${node_version}\"]"`
    sed -E -i '' 's/\$NODE_VERSION/'"${node_version}"'/' rails/${ruby_version}-${node_version}/Dockerfile
    sed -E -i '' 's/\$YARN_VERSION/'"${yarn_version}"'/' rails/${ruby_version}-${node_version}/Dockerfile
    sed -E -i '' 's/\$CHROMEDRIVER_VERSION/'"${CHROMEDRIVER_VERSION}"'/' rails/${ruby_version}-${node_version}/Dockerfile
  done
done