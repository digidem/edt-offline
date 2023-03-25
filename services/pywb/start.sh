#!/usr/bin/env bash

UID=${PUID:-1000}  # If variable not set or null, use default.
GID=${PGID:-1000}
echo "Creating collection and adding warcz files"
wb-manager add all /source/*.warcz
wb-manager add all /source/*.warc.gz
echo "--------- Starting Pywb -----------"
sh /docker-entrypoint.sh
uwsgi  --uid $UID --gid $GID /uwsgi/uwsgi.ini