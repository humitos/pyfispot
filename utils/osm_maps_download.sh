#!/bin/bash

set -e
cd ~/apps/mapas

# Download maps for OSMAnd for Android
wget -c -N "http://download.osmand.net/download.php?standard=yes&file=Peru_southamerica_2.obf.zip" -O Peru_southamerica_2.obf.zip
wget -c -N "http://download.osmand.net/download.php?standard=yes&file=Bolivia_southamerica_2.obf.zip" -O Bolivia_southamerica_2.obf.zip
wget -c -N "http://download.osmand.net/download.php?standard=yes&file=Ecuador_southamerica_2.obf.zip" -O Ecuador_southamerica_2.obf.zip
wget -c -N "http://download.osmand.net/download.php?standard=yes&file=Chile_southamerica_2.obf.zip" -O Chile_southamerica_2.obf.zip

# Extras
wget -c -N "http://download.osmand.net/download.php?standard=yes&file=World_altitude_correction_WW15MGH.extra.zip" -O World_altitude_correction_WW15MGH.extra.zip
wget -c -N "http://download.osmand.net/download.php?standard=yes&file=World_basemap_2.obf.zip" -O World_basemap_2.obf.zip
wget -c -N "http://download.osmand.net/download.php?standard=yes&file=World_seamarks_basemap_2.obf.zip" -O World_seamarks_basemap_2.obf.zip


# Download maps for Maps.ME
wget -c -N http://direct.mapswithme.com/direct/latest/Peru.mwm.routing
wget -c -N http://direct.mapswithme.com/direct/latest/Chile.mwm.routing
wget -c -N http://direct.mapswithme.com/direct/latest/Ecuador.mwm.routing
wget -c -N http://direct.mapswithme.com/direct/latest/Bolivia.mwm.routing
