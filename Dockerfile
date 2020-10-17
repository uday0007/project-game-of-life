
FROM httpd
MAINTAINER uday
RUN apt-get update -y && apt-get install default-jdk -y && apt-get install maven -y
COPY mallam.txt /var/www/html/
                           
