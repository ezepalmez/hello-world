FROM openjdk:8-jre-alpine as builder

WORKDIR application
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} helloworld.jar
RUN java -Djarmode=layertools -jar application.jar extract

FROM openjdk:11-jre-slim
WORKDIR application
COPY --from=builder application/dependencies/ ./
COPY --from=builder application/spring-boot-loader/ ./
COPY --from=builder application/snapshot-dependencies/ ./
COPY --from=builder application/application/ ./

EXPOSE 8081

ENTRYPOINT ["java", "org.springframework.boot.loader.JarLauncher"]
