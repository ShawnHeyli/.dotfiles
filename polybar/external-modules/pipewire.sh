#!/bin/sh

searchString=$()

getDefaultSink() {
    defaultSink=$(pactl info | pactl info | sed -n -e 's/^.*Default Sink: //p')
    description=$(pactl list sinks | grep -A1 ${defaultSink}$ | tail -n 1 | cut -d ":" -f 2)
    echo "${description}"
}

#getDefaultSource() {
#    defaultSource=$(pactl info | awk -F : '/Default Source:/{print $2}')
#    description=$(pactl list sources | grep -A1 'Name: ${defaultSource}$' | tail -n 1)
#    echo "${description}"
#}

VOLUME=$(pamixer --get-volume-human)
SINK=$(getDefaultSink)
#SOURCE=$(getDefaultSource)

#case $1 in
#    "--up")
#        pamixer --increase 10
#        ;;
#    "--down")
#        pamixer --decrease 10
#        ;;
#    "--mute")
#        pamixer --toggle-mute
#        ;;
#    *)
#        #echo "Source: ${SOURCE} | Sink: ${VOLUME} ${SINK}"
#        echo "Sound: ${VOLUME} ${SINK}"
#esac


echo "Sound: ${VOLUME} ${SINK}"
