#!/bin/sh

function notifysend() {
    #Detect the name of the display in use
    local display=":$(ls /tmp/.X11-unix/* | sed 's#/tmp/.X11-unix/X##' | head -n 1)"

    #Detect the user using such display
    local user=$(who | grep '('$display')' | awk '{print $1}' | head -n 1)

    #Detect the id of the user
    local uid=$(id -u $user)

    sudo -u $user DISPLAY=$display DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$uid/bus notify-send "$@"
}

notifysend -u critical 'Low battery' 'Battery is low, go plug-in this fucking laptop' --expire-time=20000

battery_level=$(cat /sys/class/power_supply/BAT0/capacity)

if [ $battery_level -le 5 ]; then
    echo 0 > /sys/class/leds/tpacpi::kbd_backlight/brightness
fi

for i in {1..10}
do
    echo 1 > /sys/class/leds/tpacpi::power/brightness
    sleep 1s
    echo 0 > /sys/class/leds/tpacpi::power/brightness
    sleep 1s
done
echo 1 > /sys/class/leds/tpacpi::power/brightness
