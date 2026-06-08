
#env|grep x11
#if [ $? == 0 ] ; then
#	# xrandr --output eDP-1 --mode 2560x1440 --pos 0x0 --rotate normal --output DP-1 --off --output HDMI-1 --off --output DP-2 --off --output HDMI-2 --off --output DP-3 --off --output DP-1-0 --off --output DP-1-1 --off --output DP-1-2 --off --output HDMI-1-0 --off --output DP-1-3 --off
#	xrandr --output eDP-1 --mode 2048x1152 --pos 0x0 --rotate normal --output DP-1 --off --output HDMI-1 --off --output DP-2 --off --output HDMI-2 --off --output DP-3 --off --output DP-1-0 --off --output DP-1-1 --off --output DP-1-2 --off --output HDMI-1-0 --off --output DP-1-3 --off
#else
	#gnome-randr --output eDP-1 --mode 2048x1152 --pos 0x0 --rotate normal --output DP-1 --off --output HDMI-1 --off --output DP-2 --off --output HDMI-2 --off --output DP-3 --off --output DP-1-0 --off --output DP-1-1 --off --output DP-1-2 --off --output HDMI-1-0 --off --output DP-1-3 --off
	DP_MONIT=$(gnome-monitor-config list|sed -n 's/.*\[ \(DP.*\) \].*/\1/p')	
	gnome-monitor-config set -LpM $DP_MONIT -p -x 1920 -y 0 -LM eDP-1 
	#gdctl
	#--logical-layout-mode
#fi
