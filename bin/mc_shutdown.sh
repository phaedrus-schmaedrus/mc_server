#!/bin/sh

/usr/bin/tmux send -t minecraft '/say server going down in 10s!' ENTER

echo "server going down in 10s!"

sleep 10s

/usr/bin/tmux send -t minecraft '/save-all' ENTER

/usr/bin/tmux send -t minecraft '/stop' ENTER

echo "killing minecraft session"

/usr/bin/tmux kill-session -t minecraft
