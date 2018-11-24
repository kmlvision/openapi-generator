FROM openapitools/openapi-generator-cli:v3.3.3

LABEL maintainer="KML VISION, devops@kmlvision.com"

RUN echo -e '#!/bin/bash\njava -jar /opt/openapi-generator/modules/openapi-generator-cli/target/openapi-generator-cli.jar "$@"' > /usr/bin/openapi-generator && \
    chmod +x /usr/bin/openapi-generator