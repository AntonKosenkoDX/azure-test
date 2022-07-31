FROM openjdk:11.0.16-jdk-slim AS builder
WORKDIR /build
COPY . .
RUN chmod +x gradlew && ./gradlew bootJar

FROM openjdk:11.0.16-slim
WORKDIR /trampoline
COPY --from=builder /build/build/libs/TestAzure-1.0-SNAPSHOT.jar ./app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]
