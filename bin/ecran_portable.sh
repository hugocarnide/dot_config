#!/bin/sh

env|grep x11
if [ $? == 0 ] ; then
	# xrandr --output eDP-1 --mode 2560x1440 --pos 0x0 --rotate normal --output DP-1 --off --output HDMI-1 --off --output DP-2 --off --output HDMI-2 --off --output DP-3 --off --output DP-1-0 --off --output DP-1-1 --off --output DP-1-2 --off --output HDMI-1-0 --off --output DP-1-3 --off
	xrandr --output eDP-1 --mode 2048x1152 --pos 0x0 --rotate normal --output DP-1 --off --output HDMI-1 --off --output DP-2 --off --output HDMI-2 --off --output DP-3 --off --output DP-1-0 --off --output DP-1-1 --off --output DP-1-2 --off --output HDMI-1-0 --off --output DP-1-3 --off
else
	#gnome-randr --output eDP-1 --mode 2048x1152 --pos 0x0 --rotate normal --output DP-1 --off --output HDMI-1 --off --output DP-2 --off --output HDMI-2 --off --output DP-3 --off --output DP-1-0 --off --output DP-1-1 --off --output DP-1-2 --off --output HDMI-1-0 --off --output DP-1-3 --off
	gnome-monitor-config set -LpM eDP-1
fi
