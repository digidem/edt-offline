#!/usr/bin/env bash

echo "Starting Earth Defenders Toolkit crawler"
# TODO: also run pywb to show what's latest crawl
echo "With timer $CRAWL_TIMER"
if [ $CRAWL_TIMER = 0 ]; then
echo "Running once"
/app/crawl.sh
fi

if [ $CRAWL_TIMER != 0 ]; then
echo "Running and sleeping for '$CRAWL_TIMER'"
while true; do /app/crawl.sh; sleep "$CRAWL_TIMER"; done
fi
