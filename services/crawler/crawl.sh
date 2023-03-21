#!/usr/bin/env bash

crawl --config /app/crawl-config.yml
mv /crawls/crawls/collections/crawl-*/archive/* /app/content/
