# devpi-server

* Website: http://doc.devpi.net/latest/index.html

# Installation

```
mkvirtualenv -p python3.2 devpi
pip install devpi-server
```

## Files needed

* [/etc/nginx/sites-available/devpi](https://github.com/humitos/pyfispot/blob/master/raspberrypi/etc/nginx/sites-available/devpi)


## Running the server

```
devpi-server --port 4040 --start
```

*NOTE:* this software consumes a lot of CPU and the RaspberryPi is not
able to handle it. So, I recommend to not use it if you are running
this config in a RaspberryPi.
