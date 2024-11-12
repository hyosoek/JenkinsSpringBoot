FROM --platform=linux/arm64 bellsoft/liberica-openjdk-alpine:17

#ARG JAR_FILE=build/libs/*.jar
#
#COPY ${JAR_FILE} app.jar

COPY build/libs/ app/

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]

