# PyFi Spot

PyFi Spot is a HotSpot
([Captive Portal](https://en.wikipedia.org/wiki/Captive_portal/)) to be
ran into a RaspberryPi.

There are a lot of information about Captive Portals on the Internet
but none of them is complete. That's why I wrote PyFi Spot -the
definitive guide.

![PyFi Spot](https://raw.githubusercontent.com/humitos/pyfispot/master/pyfispot_logo.png)

# How it works?

1. The user get connected to the WiFi network
 * if he is connected via a Smartphone, a notification is shown in his
   phone
1. The user enters a webpage on the browser
1. He is redirected to our portal
 * this is done by using some *iptables rules*
1. Our portal is shown
 * nginx + uwsgi + python 2.7 + flask
1. The user logs in into the portal
1. A new *iptable rule* is executed to allow him

# Requirements

* [RaspberryPi](http://raspberrypi.org/)
* Dondle WiFi
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

*NOTE:* click on each software to read the docs.

# Optional

This was ment to be used in courses and other events organized by the
project [Argentina en Python](http://argentinaenpython.com.ar/), so
there are some other services offered by the RaspberryPi server.

* TileStache ([OpenStreetMap](http://osm.org/) Tile Server)
  * memcache (optional)
* Offline Websites
  * elblogdehumitos.com.ar
  * argentinaenpython.com.ar
  * tutorial.djangogirls.org
* XMPP server
  * [prosody](http://prosody.im/)
  * [Candy](candy-chat.github.io/candy/)
* devpi-server

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
