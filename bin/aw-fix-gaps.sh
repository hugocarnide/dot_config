#!/bin/sh
killall aw-server-rust
killall aw-awatcher
timestamp=$(date -d '-7day 00:00:00' +%s%N)
# timestamp=$(date -d '-2day 00:00:00' +%s%N)
sh /home/hugoc/Documents/git2/fix-awatcher-gaps/fix-gaps.sh -f /home/hugoc/.local/share/activitywatch/aw-server-rust/sqlite.db 	-s $timestamp -b


aw-qt
#aw-server-rust


