#!/usr/bin/env bash

# Optional step - it takes couple of seconds (or longer) to establish a WiFi connection
# sometimes. In this case, following checks will fail and wifi-connect
# will be launched even if the device will be able to connect to a WiFi network.
# If this is your case, you can wait for a while and then check for the connection.
sleep 30

# Choose a condition for running WiFi Connect according to your use case:

# 1. Is there a default gateway?
# ip route | grep default

# 2. Is there Internet connectivity?
# nmcli -t g | grep full

# 3. Is there Internet connectivity via a google ping?
# wget --spider http://google.com 2>&1

# 4. Is there an active WiFi connection?
# iwgetid -r
SSID="${SSID:=Earth_Defenders_Toolkit}"
# TODO: change url to $HOSTNAME.local variable
cat <<'END_HTML' >/usr/src/app/ui/index.html
<!DOCTYPE HTML>
<html lang="en-US">
    <head>
        <meta charset="UTF-8">
        <title>Earth Defenders Toolkit Captive Portal</title>
        <meta http-equiv="refresh" content="0; url=http://edt.local">
    </head>
    <body>
        <p>If you are not redirected automatically, follow this <a href="http://edt.local">link to Earth Defenders Toolkit</a>.</p>
    </body>
</html>
END_HTML
# wifi-connect arguments: https://github.com/balena-os/wifi-connect/blob/master/docs/command-line-arguments.md
# TODO: conflict between proxy and captive-portal on port 80
printf 'Starting Earth Defenders Toolkit Hotspot and Captive-Portal\n'
./wifi-connect --portal-ssid "$SSID"

# Start your application here.
sleep infinity
