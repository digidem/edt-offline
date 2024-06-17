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
        <!-- <meta http-equiv="refresh" content="0; url=http://192.168.42.1:8080"> -->
        <script type="text/javascript">
            window.location.href = "http://192.168.42.1:8080"
        </script>
        <title>Page Redirection</title>
    </head>
    <body>
        <!-- Note: don't tell people to `click` the link, just tell them that it is a link. -->
        If you are not redirected automatically, follow this <a href='http://192.168.42.1:8080'>link to example</a>.
    </body>
</html>
END_HTML
# wifi-connect arguments: https://github.com/balena-os/wifi-connect/blob/master/docs/command-line-arguments.md
# TODO: conflict between proxy and captive-portal on port 80
iwgetid -r

if [ $? -eq 0 ]; then
    printf 'Skipping WiFi Connect\n'
else
    printf 'Starting Earth Defenders Toolkit Hotspot and Captive-Portal\n'
    ./wifi-connect --portal-ssid "$SSID"
fi

# Start your application here.
sleep infinity
