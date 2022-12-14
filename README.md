**Screenshots**
--------------

![Screenshot](screenshot1.png)
![Screenshot](screenshot2.png)

dwm - dynamic window manager
----------------------------
dwm is an extremely fast, small, and dynamic window manager for X.


Getting started
----------------
Install pamixer, xbacklight, xkb-switch, ![JetBrainsMono Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/JetBrainsMono.zip).
Move autostart.sh script(status bar) to ~/.dwm directory:
    
    mkdir -p ~/.dwm && mv autostart.sh ~/.dwm

Edit config.mk to match your local setup (dwm is installed into
the /usr/local namespace by default).
Afterwards enter the following command to build and install dwm (if
necessary as root):

    make clean install


Running dwm
-----------
Add the following line to your .xinitrc to start dwm using startx:

    exec dwm

In order to connect dwm to a specific display, make sure that
the DISPLAY environment variable is set correctly, e.g.:

    DISPLAY=foo.bar:1 exec dwm

(This will start dwm on display :1 of the host foo.bar.)

Configuration
-------------
The configuration of dwm is done by creating a custom config.h
and (re)compiling the source code.
