#!/bin/bash

BRIGHTNESS=
if [[ $1 == "up" ]] then
  sudo xbacklight -inc 5
elif [[ $1 == "down" ]]; then
  sudo xbacklight -dec 5
fi

BRIGHTNESS=$(sudo xbacklight -get)
ICON=$HOME/.config/dwm/icons/icons8-sun.svg

dunstify -t 2000 -i $THEME/$ICON -h string:x-canonical-private-synchronous:brightness "$BRIGHTNESS%" -h int:value:$BRIGHTNESS
