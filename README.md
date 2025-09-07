# CD Store Application

A simple CD store web application built with Java Servlets and JSP.

## Local Development

### Prerequisites

- Java 8 or higher
- Maven
- Docker and Docker Compose (for containerized testing)

### Build and Run Locally

1. Build the WAR file:

   ```
   mvn clean package
   ```

2. Run with Docker:

   ```
   docker-compose up --build
   ```

## Deploying to Render

1. Push your code to a GitHub repository.

2. Sign up for a [Render](https://render.com/) account if you don't have one.

3. In the Render dashboard, click on "New" and select "Blueprint".

4. Connect your GitHub repository.

5. Render will automatically detect the `render.yaml` configuration file and set up the service.

6. Once deployed, your application will be available at the URL provided by Render.

## Configuration

You can customize the deployment configuration in `render.yaml` file.

## Files Structure

- `Dockerfile`: Contains Docker configuration for containerizing the application
- `docker-compose.yml`: For local Docker development
- `render.yaml`: Configuration for Render deployment
- `.dockerignore`: Files to exclude from Docker context

## Technology Stack

- Java Servlets and JSP
- Tomcat 9
- Maven
- Docker

