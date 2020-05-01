#!/bin/bash
# Default acpi script that takes an entry for all actions

case "$1" in
    button/power)
        case "$2" in
            PBTN|PWRF)
                logger 'PowerButton pressed'
                ;;
        esac
        ;;
    button/volumeup)
        su lukas -c -- "XDG_RUNTIME_DIR=/run/user/1000 pactl set-sink-volume @DEFAULT_SINK@ +5%"
        ;;
    button/volumedown)
        su lukas -c -- "XDG_RUNTIME_DIR=/run/user/1000 pactl set-sink-volume @DEFAULT_SINK@ -5%"
        ;;
    button/mute)
        su lukas -c -- "XDG_RUNTIME_DIR=/run/user/1000 pactl set-sink-mute @DEFAULT_SINK@ toggle"
        ;;
    button/f20)
        su lukas -c -- "XDG_RUNTIME_DIR=/run/user/1000 pactl set-source-mute @DEFAULT_SOURCE@ toggle"
        ;;
    video/brightnessup)
       echo $(($(cat /sys/class/backlight/intel_backlight/brightness) + 1210)) > /sys/class/backlight/intel_backlight/brightness
        ;;
    video/brightnessdown)
        echo $(($(cat /sys/class/backlight/intel_backlight/brightness) - 1210)) > /sys/class/backlight/intel_backlight/brightness
        ;;
esac

# vim:set ts=4 sw=4 ft=sh et:
