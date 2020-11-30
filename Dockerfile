FROM openjdk:8-jdk-alpine
LABEL maintainer="Pablo A. Vargas <pablo@pampa.cloud>"


COPY files/entrypoint.sh /usr/bin/

#VOLUME /tmp
#COPY app/*.jar app.jar

ENTRYPOINT ["/usr/bin/entrypoint.sh"]
