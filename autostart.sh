#!/bin/bash

picom -b
slstatus &
feh --bg-fill "${HOME}/pictures/groot-dark.png"
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
