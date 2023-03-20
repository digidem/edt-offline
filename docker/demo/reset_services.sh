#!/bin/sh
( crontab -l 2>/dev/null | grep -Fv ntpdate ; printf -- "*/3 * * * * /usr/sbin/ntpdate 192.168.2.3" ) | crontab

docker compose -f $PATH/docker/demo/docker-compose.yml down -v
docker compose up -d