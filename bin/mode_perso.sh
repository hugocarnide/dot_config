#!/usr/bin/bash

killall evolution
#killall rambox
killall slack

killall aw-server-rust &
killall aw-awatcher &
killall aw-watcher-window &
killall aw-watcher-afk &
killall aw-qt &
