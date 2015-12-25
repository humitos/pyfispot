#!/bin/bash

# Provides free internet access to every user without redirecting to
# the portal when they connect to the spot

IFACE_INTERNET=$1
IFACE_HOSTAPD=$2
IFACE_HOSTAPD_IP=`ifconfig $IFACE_HOSTAPD | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'`
IPTABLES=/sbin/iptables

echo "1" > /proc/sys/net/ipv4/ip_forward
$IPTABLES -t filter -A FORWARD -i $IFACE_INTERNET -o $IFACE_HOSTAPD  -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -t filter -A FORWARD -i $IFACE_HOSTAPD  -o $IFACE_INTERNET -j ACCEPT
$IPTABLES -t nat -A POSTROUTING -o $IFACE_INTERNET -j MASQUERADE
