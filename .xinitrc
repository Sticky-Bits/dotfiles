#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then







    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

#wm
xcompmgr -c &

# echo startup date to logfile
date +"%c" >> ~/.login_history.log

# set screen size
xrandr --output eDP1 --scale 1.5x1.5
xrandr --output eDP1 --primary --mode 1920x1080 --pos 0x224 --rotate normal --output DP1 --mode 3840x2160 --pos 2880x0 --rotate normal --output HDMI2 --off --output HDMI1 --off --output DP2 --off

# background image script
~/Pictures/wallpapers/geometry_svg/wallpaper_cycle.sh &

exec spectrwm

