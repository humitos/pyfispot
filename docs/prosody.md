# prosody

* Website: http://prosody.im/

# Installation

```
sudo yaourt -S prosody
```

## Files needed

* [/etc/prosody/prosody.cfg.lua](https://github.com/humitos/pyfispot/blob/master/archlinuxarm/etc/prosody/prosody.cfg.lua)


## Start it

```
sudo systemctl start prosody
```

## Configure the client

You can use any XMPP client you want to connect to prosody, but we
want something very simple to get our users to be able to chat between
them without installing anything. Because of this, we will use
[Candy](candy-chat.github.io/candy/).

You need to copy the [/home/alarm/apps/candy](https://github.com/humitos/pyfispot/blob/master/archlinuxarm/home/alarm/apps/candy) folder in your
RaspberryPi and configure NGINX using
[/etc/nginx/servers-available/redlibre](https://github.com/humitos/pyfispot/blob/master/archlinuxarm/etc/nginx/servers-available/redlibre)
to enable it.

We are using
[Candy 2.1.0](https://github.com/candy-chat/candy/releases/download/v2.1.0/candy-2.1.0.zip).
