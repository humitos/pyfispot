#!/bin/bash

# Download subtitles from all movies in a directory
MOVIE_TYPES="*.mp4 *.avi *.mkv"
PATH_MOVIES_1=/srv/deluge/torrents
PATH_MOVIES_2=/srv/deluge/external
FADES_BIN=/home/alarm/fades/bin/fades

for MOVIE_TYPE in $MOVIE_TYPES; do {
  find $PATH_MOVIES_1 $PATH_MOVIES_2 -name $MOVIE_TYPE -type f -print | \
  xargs -I '{}' $FADES_BIN -p python2 -d subliminal -x subliminal download -v \
    -p addic7ed -p opensubtitles -p podnapisi -p thesubdb -p tvsubtitles \
    -l en -l spa \
    '{}'
}; done
