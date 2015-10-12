# TileStache

* Website: http://tilestache.org/

# Dependencies

* Pillow JPEG support
```
sudo apt-get install libjpeg-dev
```

* Memcached (optional)
```
sudo apt-get install memcached
```

* uWSGI http support
```
cd /home/pi/uwsgi
python uwsgiconfig.py --plugin plugins/http core http
python uwsgiconfig.py --plugin plugins/corerouter core corerouter
```

# Installation

```
virtualenv venv
. venv/bin/activate
pip install tilestache python-memcached
```

## Files needed

* [/home/pi/tilestache/tilestache.cfg](https://github.com/humitos/pyfispot/blob/master/raspberrypi/home/pi/tilestache/tilestache.cfg)


# Run it

```
/home/pi/uwsgi/uwsgi \
 --plugin /home/pi/uwsgi/python27_plugin.so \
 --enable-threads \
 --workers 4 \
 --plugin /home/pi/uwsgi/http_plugin.so \
 --http :8080 \
 -H /home/pi/tilestache/venv \
 --eval 'import TileStache; \
         application = TileStache.WSGITileServer("/home/pi/tilestache.cfg")'
```
