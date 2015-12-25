# kodi

* Website: http://kodi.tv/

# Installation

```
sudo pacman -S kodi lsb-release omxplayer-git xorg-xrefresh xorg-xset
```

## Files needed

We need to increase the the memory used for GPU by editing the `/boot/config.txt`
```
gpu_mem=128
```

* [/boot/config.txt](https://github.com/humitos/pyfispot/blob/master/archlinuxarm/boot/config.txt)

### References

* ​http://gilgamezh.me/blog/posts/tip-para-xbmckodi-en-archlinux-arm.html
* ​https://wiki.archlinux.org/index.php/Kodi#Raspberry_Pi

# Configure the client

We are using [Kore](http://kodi.wiki/view/Kore) for Android as a
client.

* http://kodi.wiki/view/Web_interface
* http://kodi.wiki/view/Add-on:Arch


# AddOns

* webinterface.arch
* webinterface.chorus
* service.subtitles.argenteam
* service.subtitles.subdivx
* service.subtitles.subtituloses
* resource.language.es_ar
* plugin.video.youtube
* plugin.video.confreaks
* plugin.video.ted.talks
* plugin.video.vimeo
