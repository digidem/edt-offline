#!/usr/bin/env bash

# check output
echo "Checking if there are collections"
COLLECTIONS=$(wb-manager list | grep -wv /usr/local/bin/wb-manager | grep -)
_LEN=${#COLLECTIONS}
if [ "$_LEN" -lt 1 ];
then
    echo "Creating collection and adding warcz files"
    wb-manager init earthdefenderstoolkit
    wb-manager add earthdefenderstoolkit /source/*.warcz
fi
echo "--------- Starting Pywb -----------"
sh /docker-entrypoint.sh
uwsgi /uwsgi/uwsgi.ini