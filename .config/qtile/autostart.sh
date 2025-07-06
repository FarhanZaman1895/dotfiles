#!/bin/bash

# Visuals
picom &
nitrogen --restore &
xrandr --output eDP --set "TearFree" on
brightnessctl s 30%

# Pipewire
/bin/pipewire &
/usr/bin/pipewire-pulse &
wireplumber &

# Most stuff
nm-applet &
flameshot &
setxkbmap -option ctrl:nocaps
