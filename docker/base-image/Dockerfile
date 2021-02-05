# syntax=docker/dockerfile:experimental

ARG JAVA_VERSION
ARG JAVA_IMAGE=adoptopenjdk/openjdk${JAVA_VERSION}:alpine

# Download and extract binaries of libz
# This is needed because the final base image doesn't include it but the JRE needs it
# Alpine is used as base image here because of its package manager
FROM alpine AS libz_download

RUN apk --update add --no-cache ca-certificates curl openssl xz \
    && ZLIB_URL="https://archive.archlinux.org/packages/z/zlib/zlib-1%3A1.2.11-4-x86_64.pkg.tar.xz" \
    && ZLIB_SHA256=43a17987d348e0b395cb6e28d2ece65fb3b5a0fe433714762780d18c0451c149 \
    && curl -Ls ${ZLIB_URL} -o /tmp/libz.tar.xz \
    && echo "${ZLIB_SHA256}  /tmp/libz.tar.xz" | sha256sum -c - \
    && mkdir /tmp/libz \
    && tar -xf /tmp/libz.tar.xz -C /tmp/libz


# Create a minimal JRE with jlink with all necessary modules for our application
# binutils is needed because JDK13+ needs its objcopy to perform --strip-debug
# see: https://github.com/docker-library/openjdk/issues/351
#FROM $JAVA_IMAGE AS custom_jre
FROM ${JAVA_IMAGE} AS custom_jre

ARG JAVA_MODULES

RUN apk --update add --no-cache binutils \
    && jlink \
        --strip-debug \
        --no-header-files \
        --no-man-pages \
        --compress=2 \
        --output /opt/custom_jre \
        --add-modules $JAVA_MODULES


## Use a minimal base image including glibc already
# So only libz, the custom JRE and the actual app are needed
FROM gcr.io/distroless/base

ENV PATH=/opt/jre/bin

COPY --from=libz_download /tmp/libz/usr/lib/libz.so* /usr/lib
COPY --from=custom_jre /opt/custom_jre /opt/jre
