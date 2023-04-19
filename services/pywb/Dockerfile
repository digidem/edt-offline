FROM webrecorder/pywb

COPY start.sh /tmp
ENTRYPOINT ["sh", "/tmp/start.sh"]
COPY config.yaml /webarchive/config.yaml
COPY head_insert.html /tmp/head_insert.html
RUN cat /tmp/head_insert.html >> /webarchive/templates/head_insert.html
