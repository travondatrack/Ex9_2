@echo off
echo Building Docker image (will build the application inside the container)...
docker build -t chap9-cd-store:latest .

echo Done! 
echo To run locally, use: docker-compose up
echo To deploy to Render, push to your GitHub repository and link it to Render
