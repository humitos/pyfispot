# dnsmasq

* Website: http://www.thekelleys.org.uk/dnsmasq/doc.html

# Installation

## Raspbian

```
sudo apt-get install dnsmasq
```

## Arch Linux ARM

```
sudo pacman -S dnsmasq
```

Use the config file on this repository to make it work and change the
options as you need. You will probably want to change:

* server
* local
* address
* interface
* dhcp-range
* dhcp-option=3
* dhcp-option=252

## Files needed

### Raspbian

* [/etc/dnsmasq.conf](https://github.com/humitos/pyfispot/blob/master/raspberrypi/etc/dnsmasq.conf)

You will also need to start the service at startup (boot):

```
sudo update-rc.d dnsmasq enable
```

### Arch Linux ARM

* [/etc/dnsmasq.conf](https://github.com/humitos/pyfispot/blob/master/archlinuxarm/etc/dnsmasq.conf)

```
sudo systemctl enable dnsmasq
```
