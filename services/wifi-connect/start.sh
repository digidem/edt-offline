#!/usr/bin/env bash

# Optional step - it takes couple of seconds (or longer) to establish a WiFi connection
# sometimes. In this case, following checks will fail and wifi-connect
# will be launched even if the device will be able to connect to a WiFi network.
# If this is your case, you can wait for a while and then check for the connection.
sleep 5

# Choose a condition for running WiFi Connect according to your use case:

# 1. Is there a default gateway?
# ip route | grep default

# 2. Is there Internet connectivity?
# nmcli -t g | grep full

# 3. Is there Internet connectivity via a google ping?
# wget --spider http://google.com 2>&1

# 4. Is there an active WiFi connection?

length=$(expr length "$PORTAL_SSID")
lenInternet=$(expr length "$INTERNET")


if [ $length -gt 0 ] && ['$INTERNET' == 'false']; then
# Add page that redirects to other address
cat <<'END_HTML' >/usr/src/redirect/index.html
<!DOCTYPE HTML>
<html lang="en-US">
    <head>
        <meta charset="UTF-8">
        <!-- <meta http-equiv="refresh" content="0; url=http://edt.local"> -->
        <script type="text/javascript">
            window.location.href = "http://edt.local"
        </script>
        <title>Page Redirection</title>
    </head>
    <body>
        <!-- Note: don't tell people to `click` the link, just tell them that it is a link. -->
        If you are not redirected automatically, follow this <a href='http://edt.local'>link to example</a>.
    </body>
</html>
END_HTML
    # wifi-connect arguments: https://github.com/balena-os/wifi-connect/blob/master/docs/command-line-arguments.md
    printf 'Starting WiFi Captive-Portal\n'
    ./wifi-connect --portal-ssid $PORTAL_SSID --ui-directory redirect --portal-listening-port 8084 --portal-gateway edt.local
elif [ "$INTERNET" == 'true' ]; then
    printf 'Starting WiFi Connect\n'
    # ./wifi-connect --portal-listening-port 8084 --portal-gateway edt.local
    ./wifi-connect --portal-gateway 192.168.42.77
else
    printf 'Skipping WiFi Connect\n'
fi

# Start your application here.
sleep infinity
