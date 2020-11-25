# use a convenient lightweight YAML reader
FROM mikefarah/yq:3 as yaml-reader
FROM openapitools/openapi-generator-cli:v5.0.0-beta3 as openapi-builder

LABEL maintainer="KML VISION, devops@kmlvision.com"

COPY --from=yaml-reader /usr/bin/yq /usr/bin/yq
RUN echo -e '#!/bin/bash\njava -jar /opt/openapi-generator/modules/openapi-generator-cli/target/openapi-generator-cli.jar "$@"' > /usr/bin/openapi-generator && \
    chmod +x /usr/bin/openapi-generator
