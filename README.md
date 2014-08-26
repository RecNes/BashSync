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
	RUSER=user_name
	RHOST=example.com
	RPATH=/home/user/remote_path_of_files/
	LPATH=/home/user/local_path_of_backup_dir/
	LOG=/home/user/local_path_of_backup_dir/transfer.log

Do not forget to create local path if it points to nonexistent directory.

Now you need to create ssh key for this local user. On the client machine, run the following in the Terminal:

	ssh-keygen -t rsa

Then, upload public key to server with commands below. You can use whichever you want:

	cat ~/.ssh/id_rsa.pub | ssh user@hostname 'cat >> ~/.ssh/authorized_keys'
or

	ssh-copy-id -i .ssh/id_rsa.pub username:password@hostname

Append that line below to local user crontab, and change timer of the job as you wish.

	30 2 * * * sh /home/user/bashsync.sh

