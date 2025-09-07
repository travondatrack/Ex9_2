FROM tomcat:9.0-jdk11-openjdk-slim

# Remove default Tomcat webapps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the WAR file to Tomcat's webapps directory
COPY target/Chap9-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war

# Set the correct permissions
RUN chmod +x /usr/local/tomcat/bin/*.sh

# Set environment variables
ENV CATALINA_OPTS="-Djava.awt.headless=true -Djava.security.egd=file:/dev/./urandom"
ENV PORT 8080

# Expose Tomcat port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
