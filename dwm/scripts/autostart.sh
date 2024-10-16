#! /bin/sh

# configuring xrandr to adapt to my setup
#xrandr --newmode "1440x900"  136.75  1440 1536 1688 1936  900 903 909 942 -hsync +vsync
#xrandr --addmode VGA1 1440x900
#xrandr --output LVDS1 --off --output VGA1 --mode 1440x900 --rate 75 --rotate normal --primary # display output
xrandr --newmode "1600x900_75"  151.25  1600 1704 1872 2144  900 903 908 942 -hsync +vsync
xrandr --newmode "1600x900_60"  118.25  1600 1696 1856 2112  900 903 908 934 -hsync +vsync

xrandr --addmode VGA1 1600x900_75 && xrandr --addmode VGA1 1600x900_60

#xrandr --output LVDS1 --off --output VGA1 --mode 1600x900_75 --rate 75 --primary
xrandr --output LVDS1 --off --output VGA1 --mode 1600x900_60 --rate 60 --primary

# temp until finding a solution
pactl unload-module module-null-sink sink_name=Source
pactl unload-module module-virtual-source source_name=obs_virtual-mic master=Source.monitor

pactl load-module module-null-sink sink_name=Source &
pactl load-module module-virtual-source source_name=obs_virtual-mic master=Source.monitor &

#easyeffects -q
#easyeffects --gapplication-service &

# enable hardware accelerated video encoding with nvenc
nvidia-modprobe &

# changing to the correct keyboard layout
#setxkbmap -layout br -variant abnt2 &
#setxkbmap -layout us -variant dvp
setxkbmap -layout us

# restore sound levels
alsactl --file $XDG_CONFIG_HOME/alsa/asound.state restore

# disabling "Logitech M170 acceleration if the device id is 15"
# xorg-xinput needs to be installed
xinput set-prop "15" "libinput Accel Profile Enabled" 0 1 0 
# applying a custom sensitivity
xinput set-prop "15" "libinput Accel Speed" -0.20

# running a custom shell script to show a minimal status bar
killall statusbar.sh
$XDG_CONFIG_HOME/dwm/scripts/statusbar.sh &

# daemon of flameshot screenshot tool
killall flameshot
flameshot &

#nitrogen --set-auto ~/pics/wpps/wallhaven-2y6kd9.png & # bg wallpaper
# setting a background wallpaper with feh 
#feh --bg-scale $HOME/pics/wpps/wallhaven-gp6xpq.jpg &
#feh --bg-scale $HOME/pics/wpps/wallhaven-vqly23.jpg
feh --bg-scale $HOME/pics/wpps/wallhaven-7p5kkv.png

# window compositor for enabling transparent windows
killall xcompmgr
xcompmgr &

lxpolkit &
