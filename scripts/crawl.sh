#!/bin/sh
docker-compose -f docker/cloud/docker-compose.yml run crawler crawl --config /app/crawl-config.yml
