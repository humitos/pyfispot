#!/bin/bash
# Strongly based on:
#  http://www.andybev.com/index.php/Using_iptables_and_PHP_to_create_a_captive_portal

# sudo ./run_iptables wlan1 wlan0
# sudo ./run_iptables eth0 wlan0

IFACE_INTERNET=$1
IFACE_HOSTAPD=$2
IFACE_HOSTAPD_IP=`ifconfig $IFACE_HOSTAPD | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'`

IPTABLES=/sbin/iptables

# Used to DROP n' log packages in /var/log/messages
# $IPTABLES -N logdrop
# $IPTABLES -A logdrop -m limit --limit 5/m --limit-burst 10 -j LOG
# $IPTABLES -A logdrop -j DROP

# Used to ACCEPT n' log packages in /var/log/messages
# $IPTABLES -N logaccept
# $IPTABLES -A logaccept -m limit --limit 5/m --limit-burst 10 -j LOG
# $IPTABLES -A logaccept -j ACCEPT

# Useful to log the traffic and be able to debug
# $IPTABLES -t raw -A PREROUTING -p tcp --dport 80 -j TRACE
# $IPTABLES -t raw -A OUTPUT -p tcp --dport 80 -j TRACE

# Create internet chain.
# This is used to authenticate users who have already signed up.
$IPTABLES -t mangle -N internet

# First send all traffic via newly created internet chain.
# At the prerouting NAT stage this will DNAT them to the local
# webserver for them to signup if they aren't authorised.
# Packets for unauthorised users are marked for dropping later.
$IPTABLES -i $IFACE_HOSTAPD -t mangle -A PREROUTING -j internet

# Mark the packet as 99.
$IPTABLES -i $IFACE_HOSTAPD -t mangle -A internet -j MARK --set-mark 99

# Redirects web requests from Unauthorised users to logon Web Page.
$IPTABLES -i $IFACE_HOSTAPD -t nat -A PREROUTING -m mark --mark 99 -p tcp --dport 80 -j DNAT --to-destination $IFACE_HOSTAPD_IP
# TODO: redirect 443 also to our nginx with https and another redirect

# Allow all the port we want to provide to the users
# 80 HTTP
# 443 HTTPS
# 5222 XMPP
# 6667 IRC
for port in 80 443 22 5222 6667;
do {
  $IPTABLES -t filter -A FORWARD -p tcp --dport $port -m mark ! --mark 99 -j ACCEPT
  $IPTABLES -t filter -A FORWARD -p tcp --sport $port -m mark ! --mark 99 -j ACCEPT
}; done

# Accept all FORWARDed traffic after the user logs in
# $IPTABLES -i $IFACE_HOSTAPD -t filter -A FORWARD -p tcp -m mark ! --mark 99 -j ACCEPT

# Allow ICMP echo (input/output).
$IPTABLES -t filter -A FORWARD -p icmp --icmp-type echo-reply -j ACCEPT
$IPTABLES -t filter -A FORWARD -p icmp --icmp-type echo-request -j ACCEPT

# Now that we've got to the forward filter, drop all packets
# marked 99 - these are unknown users. We can't drop them earlier
# as there's no filter table.
$IPTABLES -i $IFACE_HOSTAPD -t filter -A FORWARD -m mark --mark 99 -j DROP

# Allow my own PC to connect directly to the RaspberryPi.
# Just for DEBUGGING purpose only.
$IPTABLES -t filter -A INPUT -m mac --mac-source 00:e0:4c:53:44:58 -j ACCEPT  # eth0 (usb adaptor)
$IPTABLES -t filter -A INPUT -m mac --mac-source c4:85:08:b5:a1:62 -j ACCEPT  # wlan0 (wifi adaptor)

# Allow the RaspberryPi to connect to uWSGI running in 3031
# (the captive portal is running with Python + Flask + uWSGI)
$IPTABLES -t filter -A INPUT -p tcp --source 127.0.0.1 --destination 127.0.0.1 -j RETURN

# Allow people to connect to services on the RaspberryPi
# (these packages come with the 99 mark so we need special rules)
$IPTABLES -t filter -A INPUT -p tcp --dport 80 -j ACCEPT  # HTTP
$IPTABLES -t filter -A INPUT -p tcp --sport 80 -j ACCEPT  # HTTP
$IPTABLES -t filter -A INPUT -p tcp --dport 443 -j ACCEPT  # HTTPS
$IPTABLES -t filter -A INPUT -p tcp --sport 443 -j ACCEPT  # HTTPS
$IPTABLES -t filter -A INPUT -p udp --dport 67 -j ACCEPT  # DHCP

$IPTABLES -t filter -A INPUT -p udp --dport 53 -j ACCEPT  # DNS (outcoming)
$IPTABLES -t filter -A INPUT -p udp --sport 53 -j ACCEPT  # DNS (incoming)

# Allow ICMP echo (input/output).
$IPTABLES -t filter -A INPUT -p icmp --icmp-type echo-reply -j ACCEPT
$IPTABLES -t filter -A INPUT -p icmp --icmp-type echo-request -j ACCEPT

# Drop anything else
$IPTABLES -i $IFACE_HOSTAPD -t filter -A INPUT -m mark --mark 99 -j DROP

# Enable Internet connection sharing
echo "1" > /proc/sys/net/ipv4/ip_forward
$IPTABLES -t filter -A FORWARD -i $IFACE_INTERNET -o $IFACE_HOSTAPD  -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -t filter -A FORWARD -i $IFACE_HOSTAPD  -o $IFACE_INTERNET -j ACCEPT
$IPTABLES -t nat -A POSTROUTING -o $IFACE_INTERNET -j MASQUERADE
