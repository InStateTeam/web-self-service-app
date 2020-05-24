gulp build
docker build -t self-service-web .
docker run -p 8888:8888 self-service-web:latest