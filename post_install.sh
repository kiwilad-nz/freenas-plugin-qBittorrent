#!/bin/sh

# Create directories
mkdir -p /config /downloads

# Create new user:group for service to run with
pw groupadd -n media -g 8675309
pw useradd -n system -u 1000 -g 8675309 -d /nonexistent -s /usr/sbin/nologin

# Set folder/file permissions to the user:group
chown -R system:media /var/db/qbittorrent/ /config /downloads

# Enable service and set service to run using specified user/group
sysrc -f /etc/rc.conf qbittorrent_user="system"
sysrc -f /etc/rc.conf qbittorrent_group="media"
sysrc -f /etc/rc.conf qbittorrent_enable="YES"

# Set config directory
sysrc -f /etc/rc.conf qbittorrent_conf_dir="/config"

# Set downloads folder
sysrc -f /etc/rc.conf qbittorrent_download_dir="/downloads"

# Start qbittorrent
service qbittorrent start

# Complete message - Print below text
echo "qBittorrent Successfully Installed"
