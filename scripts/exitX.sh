#!/bin/sh

[ "$(echo "Yes\nNo" | dmenu -p "Exit BSPWM?")" = "Yes" ] && bspc quit
