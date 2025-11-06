FROM hapiproject/hapi:v6.10.0
COPY application.yaml /app/config/application.yaml
EXPOSE 8080
