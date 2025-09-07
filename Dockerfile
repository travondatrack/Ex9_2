# Build stage
FROM maven:3.8.4-openjdk-11-slim AS build
WORKDIR /app
COPY pom.xml .
# Download all required dependencies into one layer
RUN mvn dependency:go-offline -B
COPY src ./src
RUN mvn clean package

# Run stage
FROM tomcat:9.0-jdk11-openjdk-slim

# Remove default Tomcat webapps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the WAR file from build stage
COPY --from=build /app/target/Chap9-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war

# Set the correct permissions
RUN chmod +x /usr/local/tomcat/bin/*.sh

# Set environment variables
ENV CATALINA_OPTS="-Djava.awt.headless=true -Djava.security.egd=file:/dev/./urandom"
ENV PORT 8080

# Expose Tomcat port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
