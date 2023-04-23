#!/usr/bin/with-contenv bash
# shellcheck shell=bash

file=/config/firstboot

if [ ! -e "$file" ]; then
    echo "First run!"
    echo "================================"
    echo "=======" "Adding variables" "====="
    sed -i -r "s/#SOURCE_ID/$SYNC_SOURCE_ID/g" /config/config.xml
    sed -i -r "s/#SOURCE_NAME/$SYNC_SOURCE_NAME/g" /config/config.xml
    sed -i -r "s/#CRAWLS_ID/$SYNC_CRAWLS_ID/g" /config/config.xml
    sed -i -r "s/#CRAWLS_NAME/$SYNC_CRAWLS_NAME/g" /config/config.xml
    sed -i -r "s/#MAPEO_NAME/$SYNC_MAPEO_NAME/g" /config/config.xml
    sed -i -r "s/#MAPEO_ID/$SYNC_MAPEO_ID/g" /config/config.xml
    sed -i -r "s/#FDROID_ID/$SYNC_FDROID_ID/g" /config/config.xml
    sed -i -r "s/#FDROID_NAME/$SYNC_FDROID_NAME/g" /config/config.xml
    sed -i -r "s/#INSTALLERS_ID/$SYNC_INSTALLERS_ID/g" /config/config.xml
    sed -i -r "s/#INSTALLERS_NAME/$SYNC_INSTALLERS_NAME/g" /config/config.xml
    sed -i -r "s/#TILES_ID/$SYNC_TILES_ID/g" /config/config.xml
    sed -i -r "s/#TILES_NAME/$SYNC_TILES_NAME/g" /config/config.xml
    echo "=======" "Adding authentication and setting permissions" "====="
    syncthing generate --home=/config --gui-user=${ADMIN_LOGIN} --gui-password=${ADMIN_PASSWORD}
    mkdir -p /data
    chown -R 1000:1000 /config
    chown -R 1000:1000 /data
    touch "$file"
fi

if [ ! -w "$file" ]; then
    echo "Firstboot already happened"
    exit 1
fi
