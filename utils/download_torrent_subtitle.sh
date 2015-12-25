#!/bin/bash

TORRENTS_DIR=/srv/deluge/torrents

torrentid=$1
torrentname=$2
torrentpath=$TORRENTS_DIR/$3

# MP4=`/usr/bin/find $torrentpath -iname "*.mp4"`
for VIDEO in "$torrentpath"/*.mp4;
do {
  /home/alarm/fades/bin/fades -p python2 -d subliminal -x subliminal download -l spa "$VIDEO"
}; done
echo `date` - "Torrent Details: " $torrentname $torrentpath $torrentid $MP4 >> /tmp/execute_script.log

