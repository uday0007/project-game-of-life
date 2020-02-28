
FROM ubuntu
MAINTAINER uday
RUN apt-get update -y && apt-get install default-jdk -y && apt-get install maven -y
COPY gameoflife/target/gameoflife-build-1.0-SNAPSHOT.jar /tmp/
