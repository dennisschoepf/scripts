#!/bin/bash

# Get all connected monitors with xrandr
monitors=($(xrandr | grep " connected " | awk '{ print$1 }'))

# Get first external monitor
external=${monitors[1]}

# Set up xrandr correctly if it is connected on DP3-8
if [ $external == "DP3-8" ]
then
  xrandr --output eDP1 --mode 1920x1200 --pos 0x578 --rotate normal --output DP1 --off --output DP2 --off --output DP3 --off --output DP3-1 --off --output DP3-8 --primary --mode 2560x1440 --pos 1920x0 --rotate normal --output DP4 --off --output VIRTUAL1 --off
elif [ $external == "DP1" ]
then
  xrandr --output eDP1 --mode 1920x1200 --pos 0x512 --rotate normal --output DP1 --primary --mode 3440x1440 --pos 1920x0 --rotate normal --output DP2 --off --output DP3 --off --output DP4 --off --output VIRTUAL1 --off
fi

# Re-apply nitrogen for correct wallpaper
nitrogen ~/.wallpapers/blue-1.png --set-zoom-fill
# nitrogen ~/.wallpapers/horizon-1.png --set-zoom
