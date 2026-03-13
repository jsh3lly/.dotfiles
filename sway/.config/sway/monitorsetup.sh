#!/usr/bin/env bash

DISPLAY_LAPTOP=eDP-1
DISPLAY_MONITOR=DP-2

swaymsg output $DISPLAY_LAPTOP pos 0 0 res 1920x1080@59.950Hz

if [[ $1 == "desk" ]]; then
    swaymsg output $DISPLAY_LAPTOP pos 0 928
    swaymsg output $DISPLAY_MONITOR enable
    swaymsg output $DISPLAY_MONITOR pos 1920 0 res 2560x1440@179.959Hz
    swaymsg output $DISPLAY_MONITOR adaptive_sync on
elif [[ $1 == "lap" ]]; then
    swaymsg output $DISPLAY_MONITOR disable
else
    echo "No option was selected... Options: 'desk', 'lap'"
fi
