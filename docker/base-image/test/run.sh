#!/usr/bin/env bash

IMAGE_NAME=$(openssl rand -hex 12)
FLAVOR=${1:-alpine}
JAVA_VERSION=${2:-17}

docker build -t $IMAGE_NAME --build-arg JAVA_VERSION=$JAVA_VERSION --build-arg FLAVOR=$FLAVOR .
echo
docker run --rm $IMAGE_NAME
echo
docker rmi $IMAGE_NAME
