FROM tomcat:8.0-jre8-alpine

# Copy kismi duzenlenecek teker teker gerekli uygulamalari ekleyecegiz
COPY managementserver/ServerSide/dist/managementserver.war /usr/local/tomcat/webapps/

EXPOSE 8080

CMD ["catalina.sh", "run"]