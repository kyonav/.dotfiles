#! /bin/sh

# configuring xrandr to adapt to my setup

# temp until finding a solution
#pactl unload-module module-null-sink sink_name=Source
#pactl unload-module module-virtual-source source_name=obs_virtual-mic master=Source.monitor

#pactl load-module module-null-sink sink_name=Source &
#pactl load-module module-virtual-source source_name=obs_virtual-mic master=Source.monitor &

# changing to the correct keyboard layout
setxkbmap -layout us -variant dvp

# restore sound levels
alsactl --file $XDG_CONFIG_HOME/alsa/asound.state restore

# running a custom shell script to show a minimal status bar
killall statusbar.sh
$XDG_CONFIG_HOME/dwm/scripts/statusbar.sh &

# daemon of flameshot screenshot tool
killall flameshot
flameshot &

# setting a background wallpaper with feh 
feh --bg-scale $HOME/pics/wpps/33351.png

# window compositor for enabling transparent windows
killall xcompmgr
xcompmgr &

lxpolkit &
