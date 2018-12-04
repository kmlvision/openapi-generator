# use a convenient lightweight YAML reader
FROM mikefarah/yq:latest as yaml-reader
# TODO switch back to upstream openapitools/openapi-generator-cli:latest after 
# https://github.com/OpenAPITools/openapi-generator/pull/1613 was merged and deployed
FROM kmlvision/openapi-generator-ng7-cli:latest as openapi-builder

LABEL maintainer="KML VISION, devops@kmlvision.com"

COPY --from=yaml-reader /usr/bin/yq /usr/bin/yq
RUN echo -e '#!/bin/bash\njava -jar /opt/openapi-generator/modules/openapi-generator-cli/target/openapi-generator-cli.jar "$@"' > /usr/bin/openapi-generator && \
    chmod +x /usr/bin/openapi-generator
