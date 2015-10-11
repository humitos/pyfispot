# PyFi Spot

PyFi Spot is a HotSpot
([Captive Portal](https://en.wikipedia.org/wiki/Captive_portal/)) to be
ran into a RaspberryPi.

There a lot of information about Captive Portals on the Internet but
none of them is complete. That's why I wrote PyFi Spot -the definitive
guide.

![PyFi Spot](https://raw.githubusercontent.com/humitos/pyfispot/master/pyfispot_logo.png)

# Requirements

* [RaspberryPi](http://raspberrypi.org/)
* Dondle WiFi
  (e.g. [TL-WN722G](http://www.tp-link.com/en/products/details/cat-11_TL-WN722N.html)
  or
  [TL-WN322N](http://www.tp-link.com/ve/products/details/?model=TL-WN322G))
* hostapd
* dnsmasq
* PyFi Spot
  * nginx
  * uWSGI
  * virtualenv
  * Python 2.7
  * Flask

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

# Authors

Manuel Kaufmann (https://twitter.com/reydelhumo)

# License

GNU GENERAL PUBLIC LICENSE Version 2
