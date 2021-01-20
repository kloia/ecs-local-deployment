FROM tomcat:8.0-jre8-alpine

# Copy part shoud be modified
COPY managementserver/ServerSide/dist/managementserver.war /usr/local/tomcat/webapps/

EXPOSE 8080

CMD ["catalina.sh", "run"]