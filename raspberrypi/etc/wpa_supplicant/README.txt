# Command to connect to a WiFi network protected by WPA
sudo wpa_supplicant \
  -c/etc/wpa_supplicant/GATO_BLANCO \
  -iwlan1 \
  -Dnl80211 \  # driver for TL-WN722N
  -dd -B \
   -P/var/run/wpa_supplicant.pid \
   -f/var/log/wpa_supplicant.log

# Obtain IP by DHCP
sudo dhclient wlan1
