FROM openapitools/openapi-generator-cli:v3.3.3

LABEL maintainer="KML VISION, devops@kmlvision.com"

RUN echo "alias openapi-generator-cli='java -jar /opt/openapi-generator/modules/openapi-generator-cli/target/openapi-generator-cli.jar'" > /root/.bashrc