#!/usr/bin/env bash

IMAGE_NAME=$(openssl rand -hex 12)
FLAVOR=${1:-alpine}
JAVA_VERSION=${2:-17}
BASE_IMAGE_NAME=${3:-my-base-image}

docker build -t $IMAGE_NAME --build-arg JAVA_VERSION=$JAVA_VERSION --build-arg FLAVOR=$FLAVOR --build-arg BASE_IMAGE_NAME=$BASE_IMAGE_NAME .
echo
docker run --rm $IMAGE_NAME
echo
docker rmi $IMAGE_NAME
