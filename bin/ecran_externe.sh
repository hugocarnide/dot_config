#!/bin/sh
# DP
# xrandr --output eDP-1 --off --output DP-1 --off --output HDMI-1 --off --output DP-2 --off --output HDMI-2 --off --output DP-3 --off --output DP-1-0 --off --output DP-1-1 --mode 2560x1440 --pos 0x0 --rotate normal --output DP-1-2 --off --output HDMI-1-0 --off --output DP-1-3 --off
# HDMI
#xrandr --output eDP-1 --off --output DP-1 --off --output HDMI-1 --mode 1920x1080 --pos 0x0 --rotate normal --output DP-2 --off --output HDMI-2 --off --output DP-3 --off --output DP-1-0 --off --output DP-1-1 --off --output DP-1-2 --off --output HDMI-1-0 --off --output DP-1-3 --off
DP_MONIT=$(gnome-monitor-config list|sed -n 's/.*\[ \(DP.*\) \].*/\1/p')	
gnome-monitor-config set -LpM $DP_MONIT
