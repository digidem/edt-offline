#!/bin/bash

git clone https://github.com/ssb-ngi-pointer/go-ssb-room.git
cp docker-compose.yml go-ssb-room/
cp .env.example go-ssb-room/.env
cd go-ssb-room
docker-compose up -d
