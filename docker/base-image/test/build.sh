#!/usr/bin/env bash

JAVA_VERSION=${1:-16}

echo $JAVA_VERSION

docker build -t test --build-arg JAVA_VERSION=$JAVA_VERSION .
