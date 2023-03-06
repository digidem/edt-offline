#!/usr/bin/env bash

# portal
echo 'Downloading Portal'
curl -s https://api.github.com/repos/coolabnet/hotspot/releases/latest \
| grep "browser_download_url.*zip" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -qi -
rm -rf /usr/src/dist
unzip portal.zip
mv /usr/src/dist/* /usr/src/
# Apks
mkdir -p /usr/src/apks
wget https://f-droid.org/F-Droid.apk -O /usr/src/apks/fdroid.apk
wget https://manyver.se/apk -O /usr/src/apks/manyverse.apk
# 
# Python
echo 'Starting Python server'
python /usr/src/captive-portal.py &
python /usr/src/redirect.py