# devpi-server

* Website: http://doc.devpi.net/latest/index.html

# Installation

```
source virtualenvwrapper.sh
mkvirtualenv devpi
pip install devpi-server
```

## Files needed

* [/etc/nginx/servers-available/devpi](https://github.com/humitos/pyfispot/blob/master/archlinuxarm/etc/nginx/servers-available/devpi)
* [/etc/systemd/system/devpi.service](https://github.com/humitos/pyfispot/blob/master/archlinuxarm/etc/systemd/system/devpi.service)

## Running the server

Start the server and check it's working
```
sudo systemctl start devpi
```

If everything go ok, you can enable it at boot:
```
sudo systemctl enable devpi
```

NOTE: devpi only works properly in a RaspberryPi 2, because it's too
CPU consuming.
