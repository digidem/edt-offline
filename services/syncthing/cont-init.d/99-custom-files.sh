#!/usr/bin/with-contenv bash
# shellcheck shell=bash

echo "=======" "Adds variables" "====="

sed -i -r "s/#SOURCE_ID/$SYNC_SOURCE_ID/g" /config/config.xml
sed -i -r "s/#SOURCE_NAME/$SYNC_SOURCE_NAME/g" /config/config.xml
sed -i -r "s/#REPOSITORY_ID/$SYNC_KIWIX_REPOSITORY_ID/g" /config/config.xml
sed -i -r "s/#KIWIX_REPOSITORY/$SYNC_KIWIX_REPOSITORY/g" /config/config.xml
