FROM webrecorder/pywb

COPY start.sh /tmp
COPY config.yaml /webarchive/config.yaml
RUN mkdir -p /webarchive/templates
COPY head_insert.html /webarchive/templates/head_insert.html

ENTRYPOINT ["sh", "/tmp/start.sh"]
