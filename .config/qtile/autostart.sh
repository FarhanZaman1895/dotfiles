#!/bin/bash

# Most stuff
picom &
nm-applet &
/home/fzaman/.screenlayout/default.sh
nitrogen --restore &
setxkbmap -option ctrl:nocaps

# Pipewire
/bin/pipewire &
/usr/bin/pipewire-pulse &
wireplumber &
