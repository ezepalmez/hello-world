FROM openjdk:8-jre-alpine

WORKDIR /usr/app
COPY target/helloworld-1.0.0.jar /usr/app/

# Run the jar file 
ENTRYPOINT ["java","-Dserver.port=8081","-Djava.security.egd=file:/dev/./urandom","-jar", "helloworld-1.0.0.jar"]
