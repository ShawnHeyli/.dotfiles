#!/bin/bash

color_connected="#f00"
color_disconnected="#0f0"

output=$(protonvpn-cli s)
connection_status=$(head -n 1 <<< $output | awk '{print $2}')

if [ "$connection_status" = 'Connected' ]
then
  server=$(sed '4q;d' <<< $output | awk '{print $2}')
  echo "%{F#0f0}  ${server}%{F-}"
else
  echo "%{F#0f0}  Disconnected%{F-}"
fi
