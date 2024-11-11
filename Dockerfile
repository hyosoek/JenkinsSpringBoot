FROM --platform=linux/arm64 bellsoft/liberica-openjdk-alpine:17

COPY build/libs/ app/

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app/your-app.jar"]
