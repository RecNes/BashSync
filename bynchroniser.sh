#!/bin/sh
# Cron automated synchronization script.
#
# Desc: Synchronize remote folder into local machine. Duplicate processes 
#       are disallowed until running process finished.
#
# Author: Sencer HAMARAT (RecNes)
# E-Mail: sencerhamarat@gmail.com

RSYNC=/usr/bin/rsync
SSH=/usr/bin/ssh
KEY=/home/user/.ssh/id_rsa.pub
RUSER=user_name
RHOST=example.com
RPATH=/home/user/remote_path_of_files/
LPATH=/home/user/local_path_of_backup_dir/
LOG=/home/user/local_path_of_backup_dir/transfer.log
PIDS=`pidof rsync`

if [ -z "$PIDS" ]; then
        echo "No process alive... Starting an instance."
        $RSYNC --partial --progress -avvz -e $SSH $RHOST:$RPATH $LPATH 2>&1 | tee $LOG
        exit 1
else
        echo "An instace is running in background. Done nothing."
fi

