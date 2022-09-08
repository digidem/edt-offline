#!/usr/bin/env bash

# Optional step - it takes couple of seconds (or longer) to establish a WiFi connection
# sometimes. In this case, following checks will fail and wifi-connect
# will be launched even if the device will be able to connect to a WiFi network.
# If this is your case, you can wait for a while and then check for the connection.
sleep 9

# Choose a condition for running WiFi Connect according to your use case:

# 1. Is there a default gateway?
# ip route | grep default

# 2. Is there Internet connectivity?
# nmcli -t g | grep full

# 3. Is there Internet connectivity via a google ping?
# wget --spider http://google.com 2>&1

# 4. Is there an active WiFi connection?
# iwgetid -r
INTERNET_MODE="${INTERNET:=0}"
# IF variable INTERNET_MODE is '1' or 1 or 'true'; DO default wifi-connect app
if [ "$INTERNET_MODE" == 's' ] || [ "$INTERNET_MODE" == 'yes' ] || [ "$INTERNET_MODE" == 'y' ] || [ "$INTERNET_MODE" == '1' ] || [ "$INTERNET_MODE" == 1 ] || [ "$INTERNET_MODE" == 'true' ]; then
    printf 'Starting WiFi Connect\n'
    ./wifi-connect --portal-ssid $PORTAL_SSID
# ELSE start captive-portal pointing to EDT portal
# Add page that redirects to other address
# TODO: change url to $HOSTNAME.local variable
else
cat <<'END_HTML' >/usr/src/redirect/index.html
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
    printf 'Starting Earth Defenders Toolkit Hotspot and Captive-Portal\n'
    ./wifi-connect --portal-ssid $PORTAL_SSID --ui-directory redirect
fi

# Start your application here.
sleep infinity
