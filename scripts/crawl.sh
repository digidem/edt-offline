#!/bin/sh
docker-compose \
    -f docker/cloud/docker-compose.yml \
    run \
    --build \
    -e CRAWL_TIMER=0 \
    crawler \
    crawl --config /app/crawl-config.yml
