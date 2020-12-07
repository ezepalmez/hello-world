# Start with a base image containing Java runtime
FROM openjdk:8-jre-alpine
# Add Maintainer Info
LABEL maintainer "ezpalmez@gmail.com"
# env variables required during build 
ENV APP_ROOT =/usr/app

COPY target/helloworld.jar ${APP_ROOT}/

WORKDIR ${APP_ROOT}

#Docker comprueba periódicamente el estado de salud de nuestro contenedor
HEALTHCHECK CMD curl --fail http://127.0.0.1:10000 || exit
# Run the jar file 
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","helloworld.jar"]

#ENTRYPOINT ["java","-cp","app:app/lib/*","helloworld.jar"]   ## con folder target generado

