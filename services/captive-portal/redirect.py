#!/usr/bin/python

from BaseHTTPServer import BaseHTTPRequestHandler, HTTPServer
import subprocess

RE_PORT    = 9090
PORT       = 8081
IFACE      = "wlan0"      # the interface that captive portal protects

ip_pipe = subprocess.Popen(['ip', 'r'],  stdout=subprocess.PIPE)
interface_pipe = subprocess.Popen (['grep', IFACE], stdin=ip_pipe.stdout, stdout=subprocess.PIPE)
IP_ADDRESS = subprocess.check_output (['cut', '-d', ' ', '-f', '9'], stdin=interface_pipe.stdout).split()[0]
'''
Redirect
'''
class Redirect(BaseHTTPRequestHandler):
    #this is the index of the captive portal
    #it simply redirects the user to the to login page
    html_redirect = """
    <html>
    <head>
        <meta http-equiv="refresh" content="0; url=http://%s:%s" />
    </head>
    <body>
        <b>Redirecting to portal</b>
    </body>
    </html>
    """%(IP_ADDRESS, PORT)

    '''
    if the user requests the login page show it, else
    use the redirect page
    '''
    def do_GET(self):
        path = self.path
        self.send_response(200)
        self.send_header("Content-type", "text/html")
        self.end_headers()
        self.wfile.write(self.html_redirect)

httpdRe = HTTPServer(('', RE_PORT), Redirect)
print 'started httpserver on'+str(RE_PORT)

try:
    httpdRe.serve_forever()
except KeyboardInterrupt:
    pass
httpdRe.server_close()
