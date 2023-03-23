#!/bin/sh
echo "Starting tileserver-gl"

if ! which -- "${1}"; then
  # first arg is not an executable
  if [ -e /tmp/.X99-lock ]; then rm /tmp/.X99-lock -f; fi
  export DISPLAY=:99
  Xvfb "${DISPLAY}" -nolisten unix &
  # exec node /usr/src/app/ "$@"
  # Check if config exists
  if [ -e /data/config.json ]
  then
    echo "config ok..."
  else
    echo "NO CONFIG!"
  fi
  # Check if mbtiles exists
  if [ -e /data/mbtiles/tiles.mbtiles ]
  then
      # run && check size
      echo "mbtile ok..."
      node /usr/src/app/ --config /data/config.json
  else
    # if not, download
    echo "Not tiles, let's download"
    echo "Cloning Terrastories/default-offline-map"
    git clone --quiet "https://github.com/Terrastories/default-offline-map" tmp
    echo "Cloned!"
    echo "Moving files to /data folder"
    mkdir -p /data/fonts /data/sprites /data/styles
    cp -r tmp/fonts/* /data/fonts
    cp tmp/sprites/* /data/sprites
    cp tmp/styles/* /data/styles
    rm -rf tmp
    echo "Downloading tiles..."
    curl -fSL "https://bit.ly/39EdYoQ" -o "/data/mbtiles/tiles.mbtiles" --create-dirs
    echo "All done!"
    node /usr/src/app/ --config /data/config.json
  fi
fi

exec "$@"
