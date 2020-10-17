
FROM httpd
MAINTAINER uday
COPY gameoflife-build/target/gameoflife-build-1.0-SNAPSHOT.jar /var/www/html/
