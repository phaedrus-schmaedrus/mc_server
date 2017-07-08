#!/bin/bash
# Automagically backs up minecraft world by creating tar.gz file and naming it "mc_world_$date"

# sets $today to return date in dd.mm.yyyy format

today=$(date +%d.%m.%Y)

# stops minecraft world if active

/usr/bin/tmux send-keys -t minecraft '/say server going down for backup in 60s!' ENTER

sleep 30s

/usr/bin/tmux send-keys -t minecraft '/say server going down for backup in 30s!!' ENTER

sleep 25s

/usr/bin/tmux send-keys -t minecraft '/say server going down for backup NOW!!!' ENTER

sleep 5s

/usr/bin/tmux send-keys -t minecraft '/save-all' ENTER

/usr/bin/tmux send-keys -t minecraft '/stop' ENTER

sleep 5s

# creates archive from minecraft world file and saves to backup directory

tar -czf /home/juleserver/minecraft/backup/world_backup.$today.tar.gz /home/juleserver/minecraft/world/

# logs creation of backup if above completes

if [ $? -eq 0 ]
then
    echo backup created $today >> /home/juleserver/minecraft/backup/backup.log
else
    echo backup unsuccessful $today >> /home/juleserver/minecraft/backup/backup.log
fi

# runs MC server automagically

/home/juleserver/minecraft/bin/minecraft.sh

# runs cleanup of backups

/home/juleserver/minecraft/backup/clear_old.sh
