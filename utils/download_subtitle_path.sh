#!/bin/bash

# Download subtitles from all movies in a directory
MOVIE_TYPES="*.mp4 *.avi *.mkv"
FADES_BIN=/home/alarm/fades/bin/fades
PATH_MOVIES_1=$1

for MOVIE_TYPE in $MOVIE_TYPES; do {
  find "$PATH_MOVIES_1" -name $MOVIE_TYPE -type f -print | \
  xargs -I '{}' $FADES_BIN -p python2 -d subliminal==1.1.1 -x subliminal download -v \
    -p addic7ed -p opensubtitles -p podnapisi -p thesubdb -p tvsubtitles \
    -l en -l spa \
    '{}'
}; done

