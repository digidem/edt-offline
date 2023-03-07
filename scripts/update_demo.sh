#!/bin/sh

git pull origin main
docker compose -f docker/demo up -d --build
