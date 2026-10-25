# use a convenient lightweight YAML reader
FROM mikefarah/yq:3 AS yaml-reader
FROM openapitools/openapi-generator-cli:v7.26.0 AS openapi-builder

LABEL maintainer="KOLAIDO, devops@kolaido.com"

COPY --from=yaml-reader /usr/bin/yq /usr/bin/yq
RUN echo -e '#!/bin/bash\njava -jar /opt/openapi-generator/modules/openapi-generator-cli/target/openapi-generator-cli.jar "$@"' > /usr/bin/openapi-generator && \
    chmod +x /usr/bin/openapi-generator
