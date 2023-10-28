#!/bin/sh

LOCK_FILE=/vsftpd_setup.lock
if [ -f "$LOCK_FILE" ]; then
  echo "Vsftpd setup has already been completed, skipping..."
  exec /usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf
fi

addgroup -g 433 -S $FTP_USER
adduser -u 431 -D -G $FTP_USER -h /home/vsftpd/$FTP_USER -s /bin/false $FTP_USER
echo "$FTP_USER:$FTP_PASSWORD" | /usr/sbin/chpasswd
chown -R $FTP_USER:$FTP_USER $FTP_PATH
echo $FTP_USER >>/etc/vsftpd/vsftpd.userlist
touch "$LOCK_FILE"

exec /usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf
