#!/usr/bin/env bash

IMAGE_NAME=$(openssl rand -hex 12)
JAVA_VERSION=${1:-16}

docker build -t $IMAGE_NAME --build-arg JAVA_VERSION=$JAVA_VERSION .
echo
docker run --rm $IMAGE_NAME
echo
docker rmi $IMAGE_NAME
