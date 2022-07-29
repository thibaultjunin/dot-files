#!/bin/sh

locations=("Paris" "Maker" "None" "Nice")

if [[ $# -lt 1 ]]; then
    echo "Must provide a location in order to setup the monitors. Valid locations: "
    locs=$(printf ", %s" "${locations[@]}")
    locs=${locs:2}
    echo "${locs}"
    exit 1
fi

for display in $(xrandr | grep "connected" | cut -f1 -d " "); do
    if [[ $display == eDP* ]]; then
        continue
    fi
    xrandr --output "${display}" --off
done

sleep 1

case $1 in
    "Paris")
        xrandr --output eDP-1 --primary --mode 1920x1080 --output DP-2-1 --mode 1920x1080 --same-as eDP-1
        xrandr --output eDP-1 --primary --mode 1920x1080 --output DP-2-2 --mode 1920x1080 --left-of DP-2-1
        xrandr --output eDP-1 --primary --mode 1920x1080 --output DP-1-2 --mode 1920x1080 --right-of DP-2-1
        ;;
    "Maker")
        xrandr --output eDP-1 --primary --mode 1920x1080 --output HDMI-1 --mode 1920x1080 --above eDP-1
        ;;
    "Nice")
        xrandr --output eDP-1 --primary --mode 1920x1080 --output DP-1-1 --mode 1920x1080 --right-of eDP-1
        ;;
    "None")
        echo "Disabling all monitors"
        ;;
    *)
        echo "Invalid option"
        exit 2
        ;;
esac

sleep 1

refresh-polybar
