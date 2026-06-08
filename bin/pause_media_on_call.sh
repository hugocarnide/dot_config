#!/bin/bash

# Ideas from:
# https://saveman71.com/2019/automatic-pause-music-screen-lock-linux-mpris
# https://chatgpt.com/share/67e40b8f-5450-8013-a599-6a912503c67b

# Track whether *this* script disabled notification banners. We only ever
# re-enable them if we were the one who turned them off. This avoids fighting
# with the cronomix pomodoro applet, which toggles the very same
# org.gnome.desktop.notifications show-banners key for its "Do not disturb
# during Pomodoro" feature. Cronomix keeps the running state only in memory,
# so there is no file/D-Bus signal to poll; owning our own change is the
# reliable way to stay out of its way.
WE_DISABLED_BANNERS=false

while true; do
    MIC_IN_USE=$(/usr/bin/pactl list source-outputs| grep 'node.name' | grep --invert-match -e 'node.name = "ALSA plug-in\s\[code\]'|wc -l)
    GNOME_NOTIFICATION=$(gsettings get org.gnome.desktop.notifications show-banners)
    if [[ "$MIC_IN_USE" -gt 0 ]]; then
        playerctl pause
        if [[ "$GNOME_NOTIFICATION" == "true" ]] ; then
            gsettings set org.gnome.desktop.notifications show-banners false
            WE_DISABLED_BANNERS=true
        fi
    else
        # Only restore banners if we disabled them ourselves. If banners are
        # off because a pomodoro is running, leave them alone.
        if [[ "$WE_DISABLED_BANNERS" == "true" && "$GNOME_NOTIFICATION" == "false" ]] ; then
            gsettings set org.gnome.desktop.notifications show-banners true
        fi
        WE_DISABLED_BANNERS=false
    fi

    sleep 1
done
