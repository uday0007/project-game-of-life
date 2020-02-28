
FROM ubuntu
MAINTAINER uday
RUN apt-get update -y && apt-get install default-jdk -y && apt-get install maven -y
WORKDIR /var/lib/jenkins/workspace/declarative/gameoflife-build
COPY target/* /tmp/
