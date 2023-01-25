#!/bin/sh
cat ./crawl-config.yaml | docker-compose run -f docker/cloud/docker-compose.yml crawler crawl --config stdin --collection earthdefenderstoolkit
