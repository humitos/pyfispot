# PyFi Spot

* Website: https://github.com/humitos/pyfispot

# Installation

## nginx

* Website: http://nginx.org/

```
sudo apt-get install nginx
```

### Files needed

* [/etc/nginx/sites-available](https://github.com/humitos/pyfispot/blob/master/raspberrypi/etc/nginx/sites-available/redlibre)

The important section exactly for this is:

```
server {
    listen          80 default_server;
    server_name     www.portal.redlibre portal.redlibre;

    access_log      /var/log/nginx/pyfispot-access.log;
    error_log       /var/log/nginx/pyfispot-error.log;

    location / { try_files $uri @pyfispot; }

    location /static {
        root /home/pi/apps/pyfispot/raspberrypi/home/pi/apps/pyfispot;
    }

    location @pyfispot {
        include uwsgi_params;
        uwsgi_pass 127.0.0.1:3031;
    }
}
```

## uWSGI

* Website: http://uwsgi-docs.readthedocs.org/en/latest/index.html

I'm using the git version of uWSGI because the version from the
RaspberryPi repository is really outdated: 1.2.3.

```
git clone https://github.com/unbit/uwsgi/
cd uwsgi
python uwsgiconfig.py --build core
python uwsgiconfig.py --plugin plugins/python core python27
```

We also need an script to be ran at startup in
[/etc/init.d/uwsgi](https://github.com/humitos/pyfispot/blob/master/raspberrypi/etc/init.d/uwsgi).

```
sudo update-rc.d uwsgi enable
```

## virtualenv

* Website: https://virtualenv.pypa.io/en/latest/

```
cd pyfispot
virtualenv venv
. venv/bin/activate
pip install flask==0.10.1
```

# Testing

If everything is properly setup, we should see the PyFi Spot Captive
Portal at http://portal.redlibre/

```
links2 http://portal.redlibre/
```
