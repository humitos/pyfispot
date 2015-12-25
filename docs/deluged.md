# deluged

* Website: http://deluge-torrent.org/

# Installation

```
sudo pacman -S deluge
```

* Optional package to avoid this UserWarning:
```
Oct 30 20:29:07 raspberrypi deluged[11586]: :0: UserWarning: You
do not have a working installation of the service_identity module: 'No
module named service_identity'.  Please install it from
<https://pypi.python.org/pypi/service_identity> and make sure all of
its dependencies are satisfied.  Without the service_identity module
and a recent enough pyOpenSSL to support it, Twisted can perform only
rudimentary TLS client hostname verification.  Many valid
certificate/hostname mappings may be rejected.
```

```
sudo pacman -S python2-service-identity
```

## Files needed

* [/srv/deluge/.config/deluge/auth](https://github.com/humitos/pyfispot/blob/master/archlinuxarm/srv/deluge/.config/deluge/auth)

## Give privileges to `alarm`

```
sudo usermod -a -G deluge alarm
```

# Start it

```
sudo systemctl start deluged
```

# Configure a client

A really good client for deluged is `deluge-gtk`. You can install it
on Debian based distros:

```
sudo apt-get install deluge-gtk
```

Then you need to configure it after install it to connect to our
deluged instance.

* ​http://dev.deluge-torrent.org/wiki/UserGuide/ThinClient#GTKUI
* ​http://dev.deluge-torrent.org/wiki/UserGuide/Authentication
