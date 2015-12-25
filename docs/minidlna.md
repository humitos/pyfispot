# minidlna

* Website: http://minidlna.sourceforge.net/

# Installation

## Arch Linux ARM

```
sudo pacman -S minidlna
```

## Files needed

### Arch Linux ARM

* [/etc/minidlna.conf](https://github.com/humitos/pyfispot/blob/master/archlinuxarm/etc/minidlna.conf)

```
sudo systemctl enable minidlna
sudo systemctl start minidlna
```

# DLNA client configuration

We can use [VLC](http://www.videolan.org/vlc/) as client by pressing
Ctrl+L to see the playlist, then `Plug'n'Play Universal` and you will
see "Red Libre - DNLA Server" there.

# Force minidlna to update our directories

```
sudo -u minidlna minidlna -R
```

