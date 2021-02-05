#!/usr/bin/env bash

IMAGE_NAME=$(openssl rand -hex 12)

docker build -t $IMAGE_NAME .
echo
docker run --rm $IMAGE_NAME
echo
docker rmi $IMAGE_NAME
