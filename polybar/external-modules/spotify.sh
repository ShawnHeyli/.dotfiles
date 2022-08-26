#!/bin/bash

if [[ $# -eq 0 ]]; then
  status="$(dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotifyd /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'PlaybackStatus')"
  if [[ $status == *"Playing"* ]]; then
    current=$(dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotifyd /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Metadata')
    artist=$(echo "$current" | sed -n '/albumArtist/{n; n; p}' | awk -F '"' '{print $2}') 
    title=$(echo "$current" | sed -n '/title/{n; p}' | awk -F '"' '{print $2}')
    zscroll -l 30 "${artist} - ${title}" &
    wait
  else
    echo "No music playing"
  fi
fi
