ARG JAVA_VERSION
ARG FLAVOR

FROM my-base-image:${JAVA_VERSION}-${FLAVOR}

COPY app.jar /app/app.jar

WORKDIR /app

CMD ["java", "-jar", "app.jar"]
