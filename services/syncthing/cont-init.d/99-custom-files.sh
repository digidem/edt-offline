#!/usr/bin/with-contenv bash
# shellcheck shell=bash

echo "=======" "Adds variables" "====="

sed -i -r "s/#SOURCE_ID/$SYNC_SOURCE_ID/g" /config/config.xml
sed -i -r "s/#SOURCE_NAME/$SYNC_SOURCE_NAME/g" /config/config.xml
sed -i -r "s/#KIWIX_ID/$SYNC_KIWIX_ID/g" /config/config.xml
sed -i -r "s/#KIWIX_NAME/$SYNC_KIWIX_NAME/g" /config/config.xml
sed -i -r "s/#MAPEO_NAME/$SYNC_MAPEO_NAME/g" /config/config.xml
sed -i -r "s/#MAPEO_ID/$SYNC_MAPEO_ID/g" /config/config.xml
sed -i -r "s/#FDROID_ID/$SYNC_FDROID_ID/g" /config/config.xml
sed -i -r "s/#FDROID_NAME/$SYNC_FDROID_NAME/g" /config/config.xml
sed -i -r "s/#INSTALLERS_ID/$SYNC_INSTALLERS_ID/g" /config/config.xml
sed -i -r "s/#INSTALLERS_NAME/$SYNC_INSTALLERS_NAME/g" /config/config.xml

echo "=======" "Creating kiwix folder and setting permissions" "====="
mkdir -p /config/kiwix
chown -R 1000:1000 /config
