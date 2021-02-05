#!/usr/bin/env bash

export DOCKER_BUILDKIT=1

JAVA_VERSION=15
JAVA_MODULES=java.base

IMAGE_NAME=my-base-image
IMAGE_TAG=$JAVA_VERSION

docker build -t $IMAGE_NAME:$IMAGE_TAG --build-arg JAVA_MODULES=$JAVA_MODULES --build-arg JAVA_VERSION=$JAVA_VERSION .
