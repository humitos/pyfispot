# hostapd

* Website: https://w1.fi/hostapd/

# Installation

```
sudo apt-get install hostapd
```

Use the config file on this repository to make it work and change the
options as you need. You will probably want to change:

* interface
* ssid
* driver

## Files needed

* [/etc/default/hostapd](https://github.com/humitos/pyfispot/blob/master/raspberrypi/etc/default/hostapd)
* [/etc/hostapd/hostapd.conf](https://github.com/humitos/pyfispot/blob/master/raspberrypi/etc/hostapd/hostapd.conf)

You will also need to start the service once the network interface is
up. To do so, you will add this line to the
[/etc/network/interfaces](https://github.com/humitos/pyfispot/blob/master/raspberrypi/etc/network/interfaces):

```
post-up /etc/init.d/hostapd start
```
