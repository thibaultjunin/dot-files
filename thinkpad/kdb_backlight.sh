#!/bin/sh

curr=$(cat /sys/class/leds/tpacpi::kbd_backlight/brightness)
max=$(cat /sys/class/leds/tpacpi::kbd_backlight/max_brightness)

if [ $curr -eq 2 ]; then
    echo 0 > /sys/class/leds/tpacpi::kbd_backlight/brightness
else
    echo $(($curr + 1)) > /sys/class/leds/tpacpi::kbd_backlight/brightness
fi
