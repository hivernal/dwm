#!/bin/bash

# picom -b --config /dev/null --backend xrender --vsync --no-frame-pacing --no-fading-openclose --no-fading-destroyed-argb --use-ewmh-active-win
# picom -b --config /dev/null --backend glx --glx-no-stencil --glx-no-rebind-pixmap --vsync --no-frame-pacing --no-fading-openclose --no-fading-destroyed-argb --use-ewmh-active-win
# picom -b --config /dev/null --backend glx --glx-no-stencil --glx-no-rebind-pixmap --vsync  --no-frame-pacing --no-fading-openclose --no-fading-destroyed-argb --unredir-if-possible --xrender-sync-fence --use-ewmh-active-win 
slstatus &
feh --bg-fill "${HOME}/pictures/groot-dark.png"
