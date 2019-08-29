curl -o mysql_backup.sh https://tecadmin.net/wp-content/downloads/scripts/mysql-backup.sh

chmod +x mysql_backup.sh

aws s3 sync /backup/ s3://terraform-s3-mysql-backup-ciis

crontab every week Sunday 2400



TODO: write script part into ansible playbook or script
