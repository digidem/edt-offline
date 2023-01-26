#!/usr/bin/env bash


echo "Creating collection and adding warcz files"
wb-manager init earthdefenderstoolkit >> /dev/null
wb-manager add earthdefenderstoolkit /source/*.warcz
echo "--------- Starting Pywb -----------"
sh /docker-entrypoint.sh
uwsgi /uwsgi/uwsgi.ini