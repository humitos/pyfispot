# RaspberryPi

* Website: http://archlinuxarm.org/

# Installation

1. Download image from here
 * RaspberryPi 1 B or B+: http://archlinuxarm.org/platforms/armv6/raspberry-pi
 * RaspberryPi 2: http://archlinuxarm.org/platforms/armv7/broadcom/raspberry-pi-2
1. Follow their instructions

# Basic configuration

Connect your ethernet cable and assign an IP to the RaspberryPi. Then
login trought SSH.

## Timezone in ArchLinux ARM

Set it to America/Lima.

```
sudo timedatectl set-timezone America/Lima
```

If you want to consult your time zone, you can run this command:

```
timedatectl list-timezones | less
```

## Change the hostname

```
sudo hostnamectl set-hostname raspberrypi
```

## Install `yaourt`

This package is useful to install package from AUR.

* https://aur.archlinux.org/packages/yaourt
* ​https://aur.archlinux.org/packages/package-query (dependency)

* Install `package-query`
```
curl -O --remote-header-name https://aur.archlinux.org/cgit/aur.git/snapshot/package-query.tar.gz
tar xvfz package-query.tar.gz
cd package-query
makepkg -sri
```

* Install `yaourt`
```
curl -O --remote-header-name https://aur.archlinux.org/cgit/aur.git/snapshot/yaourt.tar.gz
tar xvfz yaourt.tar.gz
cd yaourt
makepkg -sri
```

## Install some utilities

```
sudo pacman -S dnsmasq hostapd vim htop git mercurial
sudo pacman -S zd1211
sudo pacman -S wireless_tools traceroute
sudo pacman -S nginx uwsgi uwsgi-plugin-python2 dnsutils conntrack-tools
sudo pacman -S udisks
sudo pacman -S dhclient wpa_supplicant wpa_actiond
sudo pacman -S colordiff
```

```
yaourt -S byobu
```
