#!/bin/sh

# Map to XF86 keysym - Dell Inspiron 5570 -- $mod+p mapper -- Maps respective to F8
# Configure executable permission - user access for dmenu `chmod + x`

# Internal display config -- get from "xrandr | grep \ connected"
IN_SIG="eDP-1"

# Display choices in dmenu for setup
choices="Internal\nDualSetup\nExternal\nClone"

# Select options
chosen=$(echo $choices | dmenu)

# Signal classification based on port directive
if [ `xrandr | grep DP-1 | grep -c ' connected '` -eq 1 ]; then
	EX_SIG="DP-1"
elif [ `xrandr | grep HDMI-1 | grep -c ' connected '` -eq 1 ]; then
	EX_SIG="HDMI-1"
elif [ `xrandr | grep HDMI-2 | grep -c ' connected '` -eq 1 ]; then
	EX_SIG="HDMI-2"
elif [ `xrandr | grep VIRTUAL1 | grep -c ' connected '` -eq 1 ]; then
	EX_SIG="VIRTUAL1"
fi

# Signal redirector - dmenu user choice
case "$chosen" in
	External) xrandr --output $IN_SIG --off --output $EX_SIG --auto --primary ;;
	Internal) xrandr --output $IN_SIG --auto --primary --output $EX_SIG --off ;;
	Clone) xrandr --output $IN_SIG --auto --output $EX_SIG --auto --same-as $IN_SIG ;;
	DualSetup) xrandr --output $IN_SIG --auto --output $EX_SIG --auto --right-of $IN_SIG --primary ;;
esac
