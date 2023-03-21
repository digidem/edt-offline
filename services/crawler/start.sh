#!/usr/bin/env bash

echo "Starting Earth Defenders Toolkit crawler"
# TODO: also run pywb to show what's latest crawl
while true; do /app/crawl.sh; sleep "$CRAWL_TIMER"; done