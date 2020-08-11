# use a convenient lightweight YAML reader
FROM mikefarah/yq:3 as yaml-reader
# TODO switch back to official openapi generator once 5.0.0 is released
FROM kmlvision/openapi-generator-ng10-cli:5.0.0-SNAPSHOT_sha.c89a5c4 as openapi-builder

LABEL maintainer="KML VISION, devops@kmlvision.com"

COPY --from=yaml-reader /usr/bin/yq /usr/bin/yq
RUN echo -e '#!/bin/bash\njava -jar /opt/openapi-generator/modules/openapi-generator-cli/target/openapi-generator-cli.jar "$@"' > /usr/bin/openapi-generator && \
    chmod +x /usr/bin/openapi-generator
