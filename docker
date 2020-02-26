
FROM ubuntu
MAINTAINER uday
RUN apt-get update && apt-get install default-jdk && apt-get install maven
WORKDIR /var/lib/jenkins/workspace/declarative/gameoflife-build
COPY /target/gameoflife-build-1.0-SNAPSHOT.jar
