# use a convenient lightweight YAML reader
FROM mikefarah/yq:3 AS yaml-reader
FROM openapitools/openapi-generator-cli:v7.26.0 AS openapi-builder

LABEL maintainer="KOLAIDO, devops@kolaido.com"

COPY --from=yaml-reader /usr/bin/yq /usr/bin/yq
RUN printf '#!/bin/bash\nexec java -jar /opt/openapi-generator/modules/openapi-generator-cli/target/openapi-generator-cli.jar "$@"\n' > /usr/bin/openapi-generator && \
    chmod +x /usr/bin/openapi-generator
