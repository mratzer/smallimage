#!/usr/bin/env bash

export DOCKER_BUILDKIT=1

JAVA_VERSION=${2:-16}
JAVA_MODULES=java.base

if [ "$1" == "alpine" ]; then
  FLAVOR="alpine"
  DOCKERFILE=Dockerfile-alpine
elif [ "$1" == "distroless" ]; then
  FLAVOR="distroless"
  DOCKERFILE=Dockerfile-distroless
else
  echo "Usage: ./build [alpine|distroless] (javaVersion)"
  exit 1
fi


IMAGE_NAME=my-base-image
IMAGE_TAG=$JAVA_VERSION-$FLAVOR


docker build -t \
  $IMAGE_NAME:$IMAGE_TAG \
  --file $DOCKERFILE \
  --build-arg JAVA_MODULES=$JAVA_MODULES \
  --build-arg JAVA_VERSION=$JAVA_VERSION \
  .
