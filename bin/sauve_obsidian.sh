#!/bin/sh
#rsync -avu --exclude .obsidian --exclude .trash /media/documents/obsidian/HugoNotes/ /run/user/1000/gvfs/onedrive:host=clemex.com,user=hugoc/OneDrive/sauvegarde/obsidian/HugoNotes/ 
rsync -rzvh --exclude .obsidian --exclude .trash /media/documents/obsidian/HugoNotes/ /run/user/1000/gvfs/onedrive:host=clemex.com,user=hugoc/OneDrive/sauvegarde/obsidian/HugoNotes/ 
