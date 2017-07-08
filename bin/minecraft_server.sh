#!/bin/bash
# Runs minecraft server in a named tmux window

# notes
# should be placed within /minecraft/bin/

# detects whether script is being run from w/in a terminal emulator;
# if so, exits tmux. no handling for screen

if [ $TERM = 'screen' ] ;then

    echo 'already in tmux!! exiting...'

    sleep 3

    /usr/bin/tmux detach-client

# creates new session if it doesn't already exist; otherwise it does nothing
    
else

    /usr/bin/tmux new-session -s minecraft -d

    # changes directory of minecraft session to minecraft directory and runs server

    /usr/bin/tmux send-keys -t minecraft 'cd /home/minecraft_server/minecraft/' ENTER

    /usr/bin/tmux send-keys -t minecraft '/usr/bin/java -Xmx4G -Xms4G -jar minecraft_server.1.12.jar -nogui' ENTER

fi
