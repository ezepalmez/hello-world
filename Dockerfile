FROM openjdk:8-jre-alpine

WORKDIR /usr/app
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} /usr/app/

# Run the jar file 
ENTRYPOINT ["java","-Dserver.port=8081","-Djava.security.egd=file:/dev/./urandom","-jar", ${JAR_FILE}]
