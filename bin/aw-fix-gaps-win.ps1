#!/bin/sh

taskkill.exe /IM aw-qt.exe
sleep 5
$timestamp=wsl -e date -d 'yesterday 00:00:00' +%s%N
# $timestamp=wsl -e date -d 'today 13:00:00' +%s%N
#$timestamp=wsl -e date -d '-7day 00:00:00' +%s%N
wsl -e bash -c  "/mnt/g/home/hugoc/Documents/git2/fix-awatcher-gaps/fix-gaps.sh -f /mnt/c/Users/hugoc/AppData/Local/activitywatch/aw-server-rust/sqlite.db 	-s $timestamp -b"

start "c:\Users\hugoc\scoop\apps\activitywatch\current\aw-qt.exe"