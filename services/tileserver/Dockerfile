FROM maptiler/tileserver-gl
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
USER root:root
RUN apt-get update
RUN apt-get -y --no-install-recommends install \
    curl \
    git
COPY ./config.json /data/config.json
RUN chown -R node:node /data
USER node:node
COPY start.sh /usr/src/app/docker-entrypoint.sh
