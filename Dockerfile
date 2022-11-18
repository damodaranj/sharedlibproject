
FROM maven:3.5-jdk-8-alpine as builder
WORKDIR /app
COPY .  /app 
RUN mvn install 

FROM openjdk:8-jre-alpine
WORKDIR /app
COPY --from=builder /app/target/jb-hello-world-maven-0.2.0.jar /app 
CMD ["java", "-jar", "/app/jb-hello-world-maven-0.2.0.jar"] 
