#! /bin/sh

setxkbmap -layout br -variant abnt2 & # keyboard layout

xrandr --output LVDS1 --off --output VGA1 --mode 1360x768 --rate 60 --rotate normal --primary # display output

$XDG_CONFIG_HOME/dwm/scripts/statusbar.sh & # status bar config

flameshot & # screenshot daemon

#nitrogen --set-auto ~/pics/wpps/wallhaven-2y6kd9.png & # bg wallpaper
feh --bg-scale $HOME/pics/wpps/wallhaven-m36vom.jpg &

xcompmgr & # window compositor
