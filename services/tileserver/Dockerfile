FROM communityfirst/tileserver-gl
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
USER root:root
RUN apt-get update
RUN apt-get -y --no-install-recommends install \
    curl \
    git
COPY ./config.json /data/config.json
RUN chown -R 1000:1000 /data
USER 1000:1000
COPY start.sh /usr/src/app/docker-entrypoint.sh
