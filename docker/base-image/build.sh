#!/usr/bin/env bash

export DOCKER_BUILDKIT=1

FLAVOR_ALPINE=alpine
FLAVOR_DISTROLESS=distroless

DEFAULT_JAVA_VERSION=17
DEFAULT_IMAGE_NAME=my-base-image


if [ "$1" == $FLAVOR_ALPINE ]; then
  FLAVOR=$FLAVOR_ALPINE
elif [ "$1" == $FLAVOR_DISTROLESS ]; then
  FLAVOR=$FLAVOR_DISTROLESS
else
  echo "Usage: ./build.sh $FLAVOR_ALPINE|$FLAVOR_DISTROLESS [javaVersion:$DEFAULT_JAVA_VERSION] [baseImageName:$DEFAULT_IMAGE_NAME]"
  echo "
  Examples:
      ./build.sh $FLAVOR_ALPINE               -> $DEFAULT_IMAGE_NAME:$DEFAULT_JAVA_VERSION-$FLAVOR_ALPINE
      ./build.sh $FLAVOR_DISTROLESS 20 foobar -> foobar:20-$FLAVOR_DISTROLESS"
  exit 1
fi


JAVA_VERSION=${2:-$DEFAULT_JAVA_VERSION}
JAVA_MODULES=java.base

IMAGE_NAME="${3:-$DEFAULT_IMAGE_NAME}"
IMAGE_TAG=$JAVA_VERSION-$FLAVOR


docker build -t \
  $IMAGE_NAME:$IMAGE_TAG \
  --file Dockerfile-$FLAVOR \
  --build-arg JAVA_MODULES=$JAVA_MODULES \
  --build-arg JAVA_VERSION=$JAVA_VERSION \
  .
