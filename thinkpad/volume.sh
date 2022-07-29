#!/bin/sh

if [ $# -ne 1 ]; then
    echo "Must provide a volume modifier"
    exit 1
fi

sinks=$(pacmd list-sinks | grep "index: " | cut -f2 -d":")

while IFS= read -r line; do
    case "$1" in
        "mute")
            echo "pactl set-sink-mute${line} toggle"
            pactl set-sink-mute${line} toggle
            ;;
        *)
            echo "pactl set-sink-volume${line} $1"
            pactl set-sink-volume${line} "$1"
            ;;
    esac
done <<< "$sinks"
