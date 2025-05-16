#! /bin/sh

# configuring xrandr to adapt to my setup

# temp until finding a solution
#pactl unload-module module-null-sink sink_name=Source
#pactl unload-module module-virtual-source source_name=obs_virtual-mic master=Source.monitor

#pactl load-module module-null-sink sink_name=Source &
#pactl load-module module-virtual-source source_name=obs_virtual-mic master=Source.monitor &

# disabling laptop output and changing external monitor resolution
xrandr --output eDP1 --off --output HDMI1 --mode 1360x768 --rate 60 --rotate normal --primary

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
feh --bg-scale $HOME/pics/wpps/rose-pine-sword.jpg

# window compositor for enabling transparent windows
killall xcompmgr
xcompmgr &

lxpolkit &

# fvck off
rm -rf $HOME/Downloads

# max performance always
powerprofilesctl set performance
