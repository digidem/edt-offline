FROM maptiler/tileserver-gl
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
USER root:root
COPY config.json /data
RUN apt-get update
RUN apt-get -y --no-install-recommends install \
    curl \
    git
RUN git clone --quiet "https://github.com/Terrastories/default-offline-map/" tmp
RUN mkdir /data/fonts /data/sprites /data/styles
RUN cp -r tmp/fonts/* /data/fonts
RUN cp tmp/sprites/* /data/sprites
RUN cp tmp/styles/* /data/styles
RUN rm -rf tmp
RUN curl -fsSL "https://bit.ly/39EdYoQ" -o "/data/mbtiles/tiles.mbtiles" --create-dirs
RUN chown -R node:node /data
USER node:node