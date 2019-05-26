#!/bin/sh

# Create directories
mkdir -p /config /downloads

# Add Jail user qbitorrent (850:850) tp FreeNAS group media (8675309)
# pw groupadd -n media -g 8675309
# pw groupmod media -m qbittorrent
pw useradd -n system -u 1000 -d /nonexistent -s /usr/sbin/nologin
pw groupadd -n admin -g 1000

# Set config directory
sysrc -f /etc/rc.conf qbittorrent_conf_dir="/config"

# Set service to run using the user:group
sysrc -f /etc/rc.conf qbittorrent_user="system"
sysrc -f /etc/rc.conf qbittorrent_group="admin"

# Set folder/file permissions to the user:group
chown -R admin:system /var/db/qbittorrent/ /config

# Enable qbittorrent
sysrc -f /etc/rc.conf qbittorrent_enable="YES"

# Complete message - Print below text
echo "qBittorrent Successfully Installed"
