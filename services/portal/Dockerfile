FROM httpd

RUN cd /tmp \
&& apt-get update \
&& apt-get install -y curl \
&& rm -rf /var/lib/apt/lists/*
# TODO: Change to download latest release
ARG VERSION="1.0.0-beta.4"
ARG REPO="digidem/edt-offline-portal"
RUN curl -Ls "https://github.com/digidem/edt-offline-portal/releases/download/v$VERSION/portal.tar.gz" \
  | tar -xvz -C /usr/local/apache2/

RUN rm -rf /usr/local/apache2/htdocs
RUN mv /usr/local/apache2/nuxt-app /usr/local/apache2/htdocs
RUN printf "<Directory \"/usr/local/apache2/htdocs\">\n        Header set Access-Control-Allow-Origin \"*\"\n</Directory>\n" >> /usr/local/apache2/conf/httpd.conf