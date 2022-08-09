#!/usr/bin/python
#adapted from https://github.com/nikosft/captive-portal/
import subprocess
from  SimpleHTTPServer import SimpleHTTPRequestHandler
from SocketServer import TCPServer
import cgi
import os

# These variables are used as settings
RE_PORT    = 9090
PORT       = 8081         # the port in which the captive portal web server listens
IFACE      = "wlan0"      # the interface that captive portal protects
FDROID_IP_1 = "148.251.140.42"
FDROID_IP_2 = "149.202.95.241"

ip_pipe = subprocess.Popen(['ip', 'r'],  stdout=subprocess.PIPE)
interface_pipe = subprocess.Popen (['grep', IFACE], stdin=ip_pipe.stdout, stdout=subprocess.PIPE)
IP_ADDRESS = subprocess.check_output (['cut', '-d', ' ', '-f', '9'], stdin=interface_pipe.stdout).split()[0]


'''
This it the http server used by the the captive portal
'''
class CaptivePortal(SimpleHTTPRequestHandler):
    '''
    https://stackoverflow.com/questions/16583827/cors-with-python-basehttpserver-501-unsupported-method-options-in-chrome
    '''
    def do_OPTIONS(self):
        self.send_response(200, "ok")
        self.send_header('Access-Control-Allow-Origin', '*')
        self.send_header('Access-Control-Allow-Methods', 'GET, OPTIONS')
        self.send_header("Access-Control-Allow-Headers", "X-Requested-With")
        self.send_header("Access-Control-Allow-Headers", "Content-Type")
        self.end_headers()
    '''
    this is called when the user submits the login form
    '''
    def do_POST(self):
        self.send_response(200)
        self.send_header("Content-Type", "application/json")
        self.send_header('Access-Control-Allow-Origin', '*')
        self.send_header('Access-Control-Allow-Headers', 'Authorization, Content-Type')
        self.send_header('Access-Control-Allow-Methods', 'POST')
        self.end_headers()
        form = cgi.FieldStorage(
            fp=self.rfile,
            headers=self.headers,
            environ={'REQUEST_METHOD':'POST',
                     'CONTENT_TYPE':self.headers['Content-Type'],
                     })
        # username = form.getvalue("username")
        # password = form.getvalue("password")
        #dummy security check
        # if username == 'nikos' and password == 'fotiou':
            #authorized user
        remote_IP = self.client_address[0]
        print ('New authorization from '+ remote_IP)
        print ('Updating IP tables')
        subprocess.call(["iptables","-t", "nat", "-I", "PREROUTING","1", "-s", remote_IP, "-j" ,"ACCEPT"])
        subprocess.call(["iptables", "-I", "FORWARD", "-s", remote_IP, "-j" ,"ACCEPT"])
        self.wfile.write("{success: true, ip:" + remote_IP + "}")
        # else:
        #     #show the login form
        #     self.wfile.write(self.html_login)

    #the following function makes server produce no output
    #comment it out if you want to print diagnostic messages
    #def log_message(self, format, *args):
    #    return

print "*********************************************"
print "* Note, if there are already iptables rules *"
print "* this script may not work. Flush iptables  *"
print "* at your own risk using iptables -F        *"
print "*********************************************"
print "Updating iptables"
print ".. Allow TCP DNS"
subprocess.call(["iptables", "-A", "FORWARD", "-i", IFACE, "-p", "tcp", "--dport", "53", "-j" ,"ACCEPT"])
print ".. Allow UDP DNS"
subprocess.call(["iptables", "-A", "FORWARD", "-i", IFACE, "-p", "udp", "--dport", "53", "-j" ,"ACCEPT"])
print ".. Allow traffic to captive portal"
subprocess.call(["iptables", "-A", "FORWARD", "-i", IFACE, "-p", "tcp", "--dport", str(PORT),"-d", IP_ADDRESS, "-j" ,"ACCEPT"])
subprocess.call(["iptables", "-A", "FORWARD", "-i", IFACE, "-p", "tcp", "--dport", str(RE_PORT),"-d", IP_ADDRESS, "-j" ,"ACCEPT"])
print ".. Allow traffic to F-Droid repositories"
subprocess.call(["iptables", "-A", "FORWARD", "-i", IFACE, "-p", "tcp", "--dport", "80","-d", FDROID_IP_1, "-j" ,"ACCEPT"])
subprocess.call(["iptables", "-A", "FORWARD", "-i", IFACE, "-p", "tcp", "--dport", "80","-d", FDROID_IP_2, "-j" ,"ACCEPT"])
print ".. Block all other traffic"
subprocess.call(["iptables", "-A", "FORWARD", "-i", IFACE, "-j" ,"DROP"])
print "Starting web server"
httpd = TCPServer(('', PORT), CaptivePortal)
print 'started httpserver on'+str(PORT)
print "Redirecting HTTP traffic to captive portal"
subprocess.call(["iptables", "-t", "nat", "-A", "PREROUTING", "-i", IFACE, "-p", "tcp", "--dport", "80", "-j" ,"DNAT", "--to-destination", IP_ADDRESS+":"+str(RE_PORT)])


try:
    httpd.serve_forever()
except KeyboardInterrupt:
    pass
httpd.server_close()
