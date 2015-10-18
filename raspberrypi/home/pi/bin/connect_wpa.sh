#!/bin/bash

WPA_FILE=$1
IFACE=$2

wpa_supplicant \
  -c/etc/wpa_supplicant/$WPA_FILE \
  -i$IFACE -Dnl80211 \
  -dd \
  -B -P/var/run/wpa_supplicant.pid \
  -f/var/log/wpa_supplicant.log

dhclient $IFACE

