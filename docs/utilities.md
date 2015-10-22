# Utilities

There are some utilities that make my life easier. So, they are listed
here:

```
sudo apt-get install \
 htop \
 usbmount \
 byobu \
 dnsutils \
 vim \
 links2 \
 git \
 mercurial \
 iptstat \
 tcpdump
```

### Activate the byobu console:

```
byoby-enable
```

### Connect to a WPA2 WiFi network

* [/etc/wpa_supplicant/GATOBLANCO](https://github.com/humitos/pyfispot/blob/master/raspberrypi/etc/wpa_supplicant/GATOBLANCO)

```
sudo wpa_supplicant \
  -c/etc/wpa_supplicant/GATOBLANCO \
  -iwlan1 \
  -Dnl80211 \
  -dd \
  -B \
  -P/var/run/wpa_supplicant.pid \
  -f/var/log/wpa_supplicant.log
```

Once it's connected, we can ask for an ip using DCHP:

```
sudo dhclient wlan1
```

### Clone/Update git repository (inside Raspberrypi)

```
git clone humitos@victoria:~/Source/pyfispot
cd pyfispot
git reset --hard origin/master
git pull
```


### Restart WPA supplicant configuration

```
sudo ifdown --force wlan1
sudo ifconfig wlan1 down
sudo ifup wlan1
```

### Downloda an entire website

This command is used to download http://tutorial.djangogirls.org/e[s|n]:

```
cd ~/apps
wget --continue --recursive \
     --no-clobber --page-requisites \
	 --html-extension --convert-links \
	 --restrict-file-names=windows \
	 --no-parent \
	 http://tutorial.djangogirls.org/en/index.html
```
