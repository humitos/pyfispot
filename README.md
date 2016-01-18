# PyFi Spot

PyFi Spot is a HotSpot
([Captive Portal](https://en.wikipedia.org/wiki/Captive_portal)) to be
ran in a RaspberryPi.

There is a lot of information about Captive Portals on the Internet
but none of them is complete. That's why I wrote PyFi Spot -the
definitive guide.

![PyFi Spot](https://raw.githubusercontent.com/humitos/pyfispot/master/pyfispot_logo.png)

# How it works?

1. The user gets connected to the WiFi network
 * if he is connected via a Smartphone, a notification is shown in his
   phone
1. The user enters a URL in the browser
1. He is redirected to our portal
 * this is done by using some *iptables rules*
1. Our portal is shown
 * nginx + uwsgi + python 2.7 + flask
1. The user logs in into the portal
1. A new *iptable rule* is executed to allow him use the connection

![Homepage](https://raw.githubusercontent.com/humitos/pyfispot/master/docs/images/homepage.png)

# Requirements

* [RaspberryPi](https://github.com/humitos/pyfispot/blob/master/docs/archlinuxarm.md)
* Dongle WiFi
  (e.g. [TL-WN722G](http://www.tp-link.com/en/products/details/cat-11_TL-WN722N.html)
  or
  [TL-WN322N](http://www.tp-link.com/ve/products/details/?model=TL-WN322G))
* [hostapd](https://github.com/humitos/pyfispot/blob/master/docs/hostapd.md)
* [dnsmasq](https://github.com/humitos/pyfispot/blob/master/docs/dnsmasq.md)
* [iptables rules](https://github.com/humitos/pyfispot/blob/master/docs/iptables.md)
* [PyFi Spot](https://github.com/humitos/pyfispot/blob/master/docs/pyfispot.md)
  * nginx
  * uWSGI
  * virtualenv
  * Python 2.7
  * Flask
  * conntrack

*NOTE:* click on each link to read their docs.

# Optional

This was meant to be used in courses and other events organized by the
project [Argentina en Python](http://argentinaenpython.com.ar/), so
there are some other services offered by the RaspberryPi server.

* [TileStache](https://github.com/humitos/pyfispot/blob/master/docs/tilestache.md) ([OpenStreetMap](http://osm.org/) Tile Server)
  * memcache (optional)
* [Offline Websites](https://github.com/humitos/pyfispot/blob/master/utils/update_tutorials.sh)
  * elblogdehumitos.com.ar
  * argentinaenpython.com.ar
  * tutorial.djangogirls.org
  * tutorial.python.org.ar
* [Chat with Prosody + Candy](https://github.com/humitos/pyfispot/blob/master/docs/prosody.md)
* [devpi-server](https://github.com/humitos/pyfispot/blob/master/docs/devpi-server.md)

# Notes

* There is no official release yet, although the code is working properly (I should have bugs -I'm sure).
* It was tested in a
  [Django Girls Workshop](http://argentinaenpython.com.ar/galeria/django-girls-mendoza/)
  at PyCon Argentina with more that 50 users. Yes, it worked, but the
  wireless connection was really congested. On the other hand, the
  RaspberryPi with ArchLinux ARM worked without any problem.

# References

* http://netfilter.org/documentation/HOWTO//packet-filtering-HOWTO.txt
* https://es.wikipedia.org/wiki/Netfilter/iptables
* http://www.chillispot.org/
* http://stackoverflow.com/questions/1989214/google-com-and-clients1-google-com-generate-204/13365853#13365853
* http://serverfault.com/questions/679393/captive-portal-popups-the-definitive-guide
* http://www.andybev.com/index.php/Using_iptables_and_PHP_to_create_a_captive_portal

# Authors

Manuel Kaufmann (https://twitter.com/reydelhumo)

# License

GNU GENERAL PUBLIC LICENSE Version 2
