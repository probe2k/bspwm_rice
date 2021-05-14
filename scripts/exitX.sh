#!/bin/sh

[ "$(echo "Yes\nNo" | dmenu -p "Do you want to exit bspwm?")" = "Yes" ] && bspc quit
