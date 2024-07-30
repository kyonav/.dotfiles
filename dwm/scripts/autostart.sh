#! /bin/sh

# starts virtual mic output script
# obs > settings > audio > advanced > monitoring device = monitor of null output
# obs > audio track > 3 dots > mic/aux > audio monitoring > monitor and output
$XDG_CONFIG_HOME/dwm/scripts/obs_virtual-mic.sh

# changing to the correct keyboard layout
setxkbmap -layout br -variant abnt2 &

# configuring xrandr to adapt to my setup
xrandr --output LVDS1 --off --output VGA1 --mode 1360x768 --rate 60 --rotate normal --primary # display output

# disabling "Logitech M170 acceleration if the device id is 15"
# xorg-xinput needs to be installed
xinput set-prop "15" "libinput Accel Profile Enabled" 0 1 0
# applying a custom sensitivity
xinput set-prop "15" "libinput Accel Speed" -0.20

# running a custom shell script to show a minimal status bar
$XDG_CONFIG_HOME/dwm/scripts/statusbar.sh &

# daemon of flameshot screenshot tool
flameshot &

#nitrogen --set-auto ~/pics/wpps/wallhaven-2y6kd9.png & # bg wallpaper
# setting a background wallpaper with feh 
feh --bg-scale $HOME/pics/wpps/wallhaven-m36vom.jpg &

# window compositor for enabling transparent windows
xcompmgr &
