#!/usr/bin/env bash

echo "--------- Starting FileBrowser -----------"
echo "Initiating config"
filebrowser config init
echo "Creating new user"
filebrowser users add ${ADMIN_LOGIN} ${ADMIN_PASSWORD} --perm.admin --lockPassword
echo "Loading config file"
echo "LOCALE: $LOCALE"
echo "Using user: $ADMIN_LOGIN and password: $ADMIN_PASSWORD"
sed -i -r "s/#LOCALE/$LOCALE/g" /config/custom/filebrowser.json
filebrowser config import /config/custom/filebrowser.json
filebrowser config set --branding.files "/config/custom/branding"
filebrowser