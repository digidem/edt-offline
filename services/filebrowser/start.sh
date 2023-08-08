#!/usr/bin/env bash

echo "--------- Starting FileBrowser -----------"
echo "Initiating config"
filebrowser config init
echo "Creating new user"
mkdir -p /users
chown -R 1000:1000 /users
filebrowser users add ${ADMIN_LOGIN} ${ADMIN_PASSWORD} --perm.admin --lockPassword
echo "Loading config file"
echo "LOCALE: $LOCALE"
echo "Using user: $ADMIN_LOGIN and password: $ADMIN_PASSWORD"
sed -i -r "s/#LOCALE/$LOCALE/g" /config/custom/filebrowser.json
filebrowser config import /config/custom/filebrowser.json

if [ -n "$FILE_NOAUTH" ]; then
  filebrowser config set --auth.method noauth
fi

filebrowser
