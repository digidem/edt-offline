#!/bin/sh
echo "Starting tileserver-gl"

run () {
  echo "Running..."
    # Check if config exists
    if [ -e /data/config.json ] && [ -e /data/mbtiles/tiles.mbtiles ] #this should be dynamic from config.json
    then
      echo "config and mbtile ok..."
      node /usr/src/app/ --config /data/config.json
    else
      echo "No config or mbtile! This is unexpected behavior!"
      echo "Checking again in 30secs"
      sleep 30
      run "$@"
    fi
  exec "$@"
}

if ! which -- "${1}"; then
  # first arg is not an executable
  if [ -e /tmp/.X99-lock ]; then rm /tmp/.X99-lock -f; fi
  export DISPLAY=:99
  Xvfb "${DISPLAY}" -nolisten unix &
  # exec node /usr/src/app/ "$@"
  run "$@"
fi
