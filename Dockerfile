# Pull base image 
From tomcat:8-jre8 

# Maintainer 
MAINTAINER "serges_c@yahoo.fr" 
COPY ./holliday1985.war /usr/local/tomcat/webapps
