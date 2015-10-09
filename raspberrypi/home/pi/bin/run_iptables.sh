#!/bin/bash
# Strongly based on:
#  http://www.andybev.com/index.php/Using_iptables_and_PHP_to_create_a_captive_portal


IPTABLES=/sbin/iptables

# Used to DROP n' log packages in /var/log/messages
$IPTABLES -N logdrop
$IPTABLES -A logdrop -m limit --limit 5/m --limit-burst 10 -j LOG
$IPTABLES -A logdrop -j DROP

$IPTABLES -t raw -A PREROUTING -p tcp --dport 80 -j TRACE
$IPTABLES -t raw -A OUTPUT -p tcp --dport 80 -j TRACE

# Allow my own PC to connect directly to the RaspberryPi.
$IPTABLES -t filter -A INPUT -m mac --mac-source 00:e0:4c:53:44:58 -j ACCEPT  # eth0 (usb adaptor)
$IPTABLES -t filter -A INPUT -m mac --mac-source c4:85:08:b5:a1:62 -j ACCEPT  # wlan0 (wifi adaptor)

# Allow the RaspberryPi to connect to uWSGI running in 3031
# (the captive portal is running with Python + Flask + uWSGI)
$IPTABLES -t filter -A INPUT -p tcp --source 127.0.0.1 --destination 127.0.0.1 -j RETURN

# Create internet chain.
# This is used to authenticate users who have already signed up.
$IPTABLES -N internet -t mangle

# First send all traffic via newly created internet chain.
# At the prerouting NAT stage this will DNAT them to the local
# webserver for them to signup if they aren't authorised.
# Packets for unauthorised users are marked for dropping later.
$IPTABLES -t mangle -A PREROUTING -j internet

# Mark the packet as 99.
$IPTABLES -t mangle -A internet -j MARK --set-mark 99

# Redirects web requests from Unauthorised users to logon Web Page.
$IPTABLES -t nat -A PREROUTING -m mark --mark 99 -p tcp --dport 80 -j DNAT --to-destination 192.168.10.1
# TODO: redirect 443 also to our nginx with https and another redirect

# Now that we've got to the forward filter, drop all packets
# marked 99 - these are unknown users. We can't drop them earlier
# as there's no filter table.
$IPTABLES -t filter -A FORWARD -m mark --mark 99 -j DROP

# Do the same for the INPUT chain to stop people accessing the web through Squid.
$IPTABLES -t filter -A INPUT -p tcp --dport 80 -j ACCEPT  # HTTP
$IPTABLES -t filter -A INPUT -p tcp --sport 80 -j ACCEPT  # HTTP
$IPTABLES -t filter -A INPUT -p udp --dport 67 -j ACCEPT  # DHCP

$IPTABLES -t filter -A INPUT -p udp --dport 53 -j ACCEPT  # DNS (outcoming)
$IPTABLES -t filter -A INPUT -p udp --sport 53 -j ACCEPT  # DNS (incoming)

$IPTABLES -t filter -A INPUT -m mark --mark 99 -j DROP



# Enable Internet connection sharing
# echo "1" > /proc/sys/net/ipv4/ip_forward
$IPTABLES -A FORWARD -i eth0 -o wlan0 -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A FORWARD -i wlan0 -o eth0 -j ACCEPT
$IPTABLES -t nat -A POSTROUTING -o eth0 -j MASQUERADE

