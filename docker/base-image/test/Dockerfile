ARG JAVA_VERSION

FROM my-base-image:${JAVA_VERSION}

COPY app.jar /app/app.jar

WORKDIR /app

CMD ["java", "-jar", "app.jar"]
