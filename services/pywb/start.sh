#!/usr/bin/env bash


echo "Creating collection and adding warcz files"
wb-manager init earthdefenderstoolkit >> /dev/null
wb-manager add earthdefenderstoolkit /source/*.warcz
wb-manager add earthdefenderstoolkit /source/*.warc.gz
echo "--------- Starting Pywb -----------"
sh /docker-entrypoint.sh
uwsgi /uwsgi/uwsgi.ini