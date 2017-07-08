#!/bin/bash

# clears all except five most recent minecraft world backups

cd /home/juleserver/minecraft/backup/

# 'ls -tr...' lists backups in the directory by last mod date, reversed (so oldest first)
# 'head -n -5' takes all except the last five lines of the ls command
# 'xargs...' runs rm with the list provided by head, or aborts if the list is empty

ls -tr world_backup*.tar.gz | head -n -5 | xargs --no-run-if-empty rm
