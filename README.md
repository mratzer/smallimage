# Overview
This is a playground to make as small as possible Docker images which are running Java applications using [Eclipse Temurin™](https://adoptium.net/temurin/releases/) JDKs.

There are two flavors of resulting images (both tested with Java 17 / 18 / 19 / 20 / 21):
* `alpine` (~ 42.8 / 42.9 / 44.4 / 44.5 / 47.5 MB)
* `distroless` (~ 56.1 / 56.2 / 57.8 / 57.8 / 61.1 MB).

# Usage

1. Create the base image(s) by running `docker/base-image/build.sh alpine|distroless [javaVersion:21] [baseImageName:my-base-image]`
   1. e.g. `./build.sh alpine`, resulting in the image `my-base-image:21-alpine`
   2. e.g. `./build.sh alpine 18`, resulting in the image `my-base-image:18-alpine`
   3. e.g. `./build.sh distroless 20 foobar`, resulting in the image `foobar:20-distroless`
2. Update the properties `java.version`, `flavor`, `baseImageName` and `appImageName` in `pom.xml` to your needs and run `mvn package`
   1. e.g. resulting in the image `my-simple-app:21-alpine` 
   2. e.g. resulting in the image `my-simple-app:18-alpine` 
   3. e.g. resulting in the image `my-simple-app:20-distroless`
