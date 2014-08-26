BashSync
========

Auto synchronization tool from remote files to local. It's running by cron daemon. Also only one instance allowed. If synchronization takes long time, cron can't run second instance.


Installation
============

Depending to OS user, copy script to anywhere in user home.
Edit file with your favorite editor and change lines below:

	RSYNC=/usr/bin/rsync
	SSH=/usr/bin/ssh
	KEY=/home/user/.ssh/id_rsa.pub
	RUSER=usner_name
	RHOST=example.com
	RPATH=/home/user/remote_path_of_files/
	LPATH=/home/user/remote_path_of_backup/
	LOG=/home/user/remote_path_of_backup/transfer.log
