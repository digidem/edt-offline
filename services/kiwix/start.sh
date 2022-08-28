#!/usr/bin/with-contenv bash
# shellcheck shell=bash
echo "=======" "Generate library.xml" "====="
rm -f /data/library.xml
touch /data/library.xml
/usr/local/bin/kiwix-manage /data/library.xml add /data/zims/*.zim
echo "Starting Kiwix"
/usr/local/bin/kiwix-serve --port 83 --verbose --library /data/library.xml
