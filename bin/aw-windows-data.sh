#!/bin/sh
DB_PATH=/run/media/hugoc/OS/Users/hugoc/AppData/Local/activitywatch/aw-server-rust/sqlite.db
DB_PATH_TMP=/tmp/sqlite.db
cp $DB_PATH $DB_PATH_TMP
DB_PATH=$DB_PATH_TMP
# timestamp=$(date -d '-7day 00:00:00' +%s%N)
timestamp=$(date -d '-2day 00:00:00' +%s%N)

#sh /home/hugoc/Documents/git2/fix-awatcher-gaps/fix-gaps.sh -f $DB_PATH 	-s $(date -d 'yesterday 00:00:00' +%s%N) -b
# sh /home/hugoc/Documents/git2/fix-awatcher-gaps/fix-gaps.sh -f $DB_PATH 	-s $timestamp -b

(/opt/activitywatch/aw-server-rust/aw-server-rust --port 5702 --dbpath $DB_PATH  --verbose)|
(sleep 2;xdg-open http://localhost:5702)
