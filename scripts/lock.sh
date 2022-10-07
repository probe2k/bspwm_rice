#!/bin/sh
#TMPBG=/tmp/screen.png
#LOCK=$HOME/.config/scripts/lock.png
#ffmpeg -f x11grab -i $DISPLAY -i $LOCK -filter_complex "gblur=20,overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2" -vframes 1 $TMPBG -loglevel quiet
#i3lock -i $TMPBG
#rm $TMPBG
slock
