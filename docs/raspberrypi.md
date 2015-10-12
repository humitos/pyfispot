# RaspberryPi

* Website: https://www.raspberrypi.org/

# Installation

1. Download image from here:
 * https://www.raspberrypi.org/downloads/raspbian/
1. Copy the image to the SD:
 * https://www.raspberrypi.org/documentation/installation/installing-images/linux.md
1. Once the RaspberryPi boots and display the menu with the
   configuration options:
 1. Enable SSH server
 1. Resize the partition
 1. Change root password
 1. Change hostname
1. Change the Time Zone
```
sudo dpkg-reconfigure tzdata
```
1. Update the disto
```
sudo apt-get update
sudo apt-get upgrade
```
