#!/usr/bin/bash


#evolution &
flatpak run org.gnome.Evolution &
#slack --gtk-version=3 &
slack &
/home/hugoc/bin/pause_media_on_call.sh &

#Desktop with notification bar
#wmctrl -m|grep Mutter
#if [ $? -eq 0 ] ; then
if [ "$XDG_SESSION_TYPE" == "wayland" ] ; then
  xhost +local:$USER > /dev/null
  if ! pgrep -f "aw-server-rust" > /dev/null; then
    /opt/activitywatch/aw-server-rust/aw-server-rust &
  fi
  if ! pgrep -f "aw-awatcher" > /dev/null; then
    aw-awatcher &
  fi
  #aw-qt &
else
  #aw-server &
  #aw-server-rust &
  #aw-watcher-window &
  #aw-watcher-afk &
  aw-qt &
fi


if [ ! -e /media/documents/git ] ; then
#gnome console
sleep 5
kgx -- /home/hugoc/bin/tomb2.sh &
fi

while [ ! -e /run/media/hugoc/documents/git ] && [ ! -e /media/documents/git ]; do
  sleep 30
done

#/opt/vscodium-bin/bin/codium --no-sandbox --unity-launch &
# Force use of wayland to avoid issue with keyboard shortcut as CTRL+ALT+LEFT or RIGHT with gnome desktop change
#code --ozone-platform=wayland /media/documents/git/ClemexStudio.code-workspace &
code /media/documents/git/ClemexStudio.code-workspace &

#obsidian &
flatpak run md.obsidian.Obsidian &
xdg-open "obsidian://open?path=/media/documents/obsidian/HugoNotes"

poetry-login

sleep 60
#nmcli d|grep eth0
# nmcli d|grep ethernet|grep " conn"
# if [ $? -eq 0 ] ; then
# 	nmcli radio wifi off &
# else
# 	nmcli radio wifi on &
# fi

# disable bluethooth
# rfkill block $(rfkill list|grep bluetooth | awk -F: '{print $1}'  )
# rfkill list

if [ "$(hostname)" == "hugo-pc-clemex" ] ; then
	flatpak run org.freefilesync.FreeFileSync
fi
