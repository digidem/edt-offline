#!/usr/bin/env bash

echo "Crawling content!"
crawl --config /app/crawl-config.yml
echo "Crawling done"
count=$(ls -1 /crawls/collections/crawl-*/archive/*.warc.gz 2>/dev/null | wc -l)
if [ $count != 0 ]
then
    echo "Creating folders if don't exist"
    mkdir -p /app/content/old-websites
    mkdir -p /app/content/offline-websites/
    echo "Moving old content"
    mv /app/content/offline-websites/* /app/content/old-websites/
    echo "Copying content to content folder"
    mv /crawls/collections/crawl-*/archive/* /app/content/offline-websites/
    echo "Moved!"
fi
echo "Sleeping for $CRAWL_TIMER seconds..."