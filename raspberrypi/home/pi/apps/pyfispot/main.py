#/usr/bin/env python2

import os
import re
import time
import commands
import logging
from logging.handlers import RotatingFileHandler

from flask import Flask, request, redirect, url_for, render_template


SERVER_NAME = 'portal'
DOMAIN_NAME = 'redlibre'
SITE_NAME = 'Red Libre'
SUDO = '/usr/bin/sudo'
ARP = '/usr/sbin/arp'
IPTABLES = '/sbin/iptables'
RMTRACK = '/usr/bin/rmtrack'
DIRNAME = os.path.dirname(os.path.abspath(__file__))
MAC_REGEX = re.compile(r'..:..:..:..:..:..')


app = Flask(__name__)
logger = logging.getLogger('pyfispot')


def setup_logging(verbose):
    logfile = os.path.join(DIRNAME, 'pyfispot.log')
    handler = RotatingFileHandler(logfile, maxBytes=1e6, backupCount=10)
    logger.addHandler(handler)
    formatter = logging.Formatter("%(asctime)s  %(name)-10s  "
                                  "%(levelname)-8s %(message)s")
    handler.setFormatter(formatter)
    logger.setLevel(logging.DEBUG)

    if verbose:
        handler = logging.StreamHandler()
        handler.setFormatter(formatter)
        logger.addHandler(handler)


@app.route('/', methods=['GET', 'POST'])
def index():
    # Check if we've been redirected by firewall to here.
    # If so redirect to registration address
    logger.debug('Comming from: %s', request.host)
    pyfispot = '{server_name}.{domain_name}'.format(
        server_name=SERVER_NAME,
        domain_name=DOMAIN_NAME)
    if pyfispot not in request.host:
        logger.debug('Trying to access: %s', request.base_url)
        logger.debug('Redirecting...')
        url = 'http://{server_name}.{domain_name}'.format(
            server_name=SERVER_NAME,
            domain_name=DOMAIN_NAME) + url_for('index') + '?goto=' + request.base_url 
        logger.debug('URL to redirect: %s', url)
        return redirect(url)  # TODO: use urlencode here

    if request.method == 'POST':
        # Attempt to get the client's mac address
        logger.debug('Looking MAC address for REMOTE ADDR: %s', request.remote_addr)
        command = '{arp} -a {remote_addr}'.format(
            arp=ARP, remote_addr=request.remote_addr)
        logger.debug('Executing command: %s', command)
        arp_output = commands.getoutput(command)
        logger.debug('ARP output: %s', arp_output)

        search = MAC_REGEX.search(arp_output)
        if search is not None:
            mac = search.group()
            logger.debug('MAC found: %s', mac)
        else:
            logger.debug('We couldnt find the MAC address.')
            return 'The MAC address doesnt exist'  # TODO: return something more specific here

        logger.debug('POST received, authenticating...')
        if 'giveme-internet' in request.form:
            enable_address(mac)

            url = request.args.get('goto', None)
            logger.debug('Redirecting to the original page requested: %s', url)

            if url is not None:
                return redirect(url, code=303)
            return redirect('http://argentinaenpython.com.ar/')
        else:
            return 'You are not authorized to browse the web'

    logger.debug('Returning "index.html" to login')
    return render_template('index.html')


def enable_address(mac):
    # Add PC to the firewall
    command = '{sudo} {iptables} -I internet 1 -t mangle -m mac --mac-source {mac} -j RETURN'.format(
        sudo=SUDO, iptables=IPTABLES, mac=mac
    )
    logger.debug('Executing command: %s', command)
    commands.getoutput(command)

    # The following line removes connection tracking for the PC
    # This clears any previous (incorrect) route info for the redirection
    command = '{sudo} {rmtrack} {remote_addr}'.format(
        sudo=SUDO, rmtrack=RMTRACK, remote_addr=request.remote_addr
    )
    logger.debug('Executing command: %s', command)
    rmtrack_output = commands.getoutput(command)
    logger.debug('rmtrack: %s', rmtrack_output)

    logger.debug('request.args: %s', request.args)
    logger.debug('Sleeping 1 second...')
    time.sleep(1)

# Initializing, also by uWSGI
setup_logging(verbose=True)
logger.debug('Initializing the app..')

if __name__ == '__main__':
    app.run('0.0.0.0', debug=True)
