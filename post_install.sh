#!/bin/sh

# Create directories and links for mount points etc.
mkdir -p /config /downloads
ln -s /usr/local/bin/python2.7 /usr/bin/python
ln -s /usr/local/bin/python2.7 /usr/bin/python2

# Add media user
pw group add -n Admin -g 1000
pw user add System -u 1000 -g 1000 -d /nonexistent -s /usr/bin/nologin

# Ensure the rc.d folder exists
mkdir -p /usr/local/etc/rc.d

# Copy the nzbget file so we can use 'service nzbget start|stop|etc'
cp ./nzbget.rc  /mnt/iocage/jails/nzbget/root/etc/rc.d/nzbget

# Set permissions
chmod 555 /etc/rc.d/nzbget

# Set permissions on mounted folders 
chown -R media:media /mnt/transfer /mnt/config /usr/local/share/nzbget

# Enable nzbget
sysrc nzbget_user=media
sysrc nzbget_enable=YES
sysrc nzbget_conf_dir=/config
