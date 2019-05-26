#!/bin/sh

# Create directories
mkdir -p /config /downloads

# Create new user:group for service to run with
pw groupadd -n admin -g 1000
pw useradd -n system -u 1000 -g 1000 -d /nonexistent -s /usr/sbin/nologin

# Set config directory
sysrc -f /etc/rc.conf qbittorrent_conf_dir="/config"

# Set service to run using the user:group
sysrc -f /etc/rc.conf qbittorrent_user="system"
sysrc -f /etc/rc.conf qbittorrent_group="admin"

# Set folder/file permissions to the user:group
chown -R system:admin /var/db/qbittorrent /config

# Enable qbittorrent
sysrc -f /etc/rc.conf qbittorrent_enable="YES"

# Complete message - Print below text
echo "qBittorrent Successfully Installed"
