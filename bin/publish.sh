#!/bin/bash

DOCKER_IMAGE_NAME=${DOCKER_IMAGE_NAME:="guildeducation/${PWD##*/}"}

# Check if we are in a single Dockerfile directory or multiple sub-tags
ls | grep Dockerfile > /dev/null 2>&1

if [[ $? -eq 0 ]]; then
  DOCKER_TAG=${DOCKER_TAG:="latest"}
  echo "Publishing ${DOCKER_IMAGE_NAME}:${DOCKER_TAG}..."
  docker push ${DOCKER_IMAGE_NAME}:${DOCKER_TAG}
else
  for i in $(ls)
  do
    ls ${i} | grep Dockerfile > /dev/null 2>&1
    if [[ $? -eq 0 ]]; then
      echo "Publishing ${DOCKER_IMAGE_NAME}:${i}..."
      docker push ${DOCKER_IMAGE_NAME}:${i}
    fi
  done
fi
