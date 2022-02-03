#!/usr/bin/env bash

export DOCKER_BUILDKIT=1

FLAVOR_ALPINE=alpine
FLAVOR_DISTROLESS=distroless

DEFAULT_JAVA_VERSION=17

JAVA_VERSION=${2:-$DEFAULT_JAVA_VERSION}
JAVA_MODULES=java.base

if [ "$1" == $FLAVOR_ALPINE ]; then
  FLAVOR=$FLAVOR_ALPINE
elif [ "$1" == $FLAVOR_DISTROLESS ]; then
  FLAVOR=$FLAVOR_DISTROLESS
else
  echo "Usage: ./build.sh $FLAVOR_ALPINE|$FLAVOR_DISTROLESS [javaVersion:$DEFAULT_JAVA_VERSION]"
  exit 1
fi


IMAGE_NAME=my-base-image
IMAGE_TAG=$JAVA_VERSION-$FLAVOR


docker build -t \
  $IMAGE_NAME:$IMAGE_TAG \
  --file Dockerfile-$FLAVOR \
  --build-arg JAVA_MODULES=$JAVA_MODULES \
  --build-arg JAVA_VERSION=$JAVA_VERSION \
  .
