#!/bin/bash

# Most stuff
picom &
nm-applet &
nitrogen --restore &
setxkbmap -option ctrl:nocaps

# Pipewire
/bin/pipewire &
/usr/bin/pipewire-pulse &
wireplumber &
