#!/bin/sh
killall -q polybar

while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

displays=$(xrandr | grep " connected " | awk '{ print$1 }')
primary_display=$(xrandr | grep " connected primary " | awk '{ print$1 }')

for display in $displays;
do
    echo "> Starting polybar for display $display"
    bar="$display"
    if [ "$display" != ${primary_display[0]} ]; then
        bar="external-display"
    else
        bar="primary-display"
    fi
    MONITOR="$display" polybar "$bar" &> /dev/null &
done

