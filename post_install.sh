#!/bin/sh

# Create directories
mkdir -p /config /downloads

# Add Jail user qbitorrent (850:850) tp FreeNAS group media (8675309)
pw groupadd -n media -g 8675309
pw groupmod media -m qbittorrent

# Set config directory
sysrc -f /etc/rc.conf qbittorrent_conf_dir="/config"

# Set service to run using the user:group
sysrc -f /etc/rc.conf qbittorrent_user="qbittorrent"
sysrc -f /etc/rc.conf qbittorrent_group="media"

# Set folder/file permissions to the user:group
chown -R qbittorrent:media /var/db/qbittorrent/conf /config

# Enable qbittorrent
sysrc -f /etc/rc.conf qbittorrent_enable="YES"

# Complete message - Print below text
echo "qBittorrent Successfully Installed"
