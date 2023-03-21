FROM webrecorder/browsertrix-crawler
COPY ./crawl-config.yml /app/crawl-config.yml
COPY ./crawl.sh /app/crawl.sh
COPY ./start.sh /app/start.sh
ENTRYPOINT ["sh", "/app/start.sh"]
