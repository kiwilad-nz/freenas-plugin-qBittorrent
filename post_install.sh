#!/bin/sh

# Create directories
mkdir -p /config /downloads

# Modify installed user qbitorrent (989:989) tp match System:Admin UID:GID from FreeNAS (1000:1000)
# pw groupmod -n qbittorrent -l Admin -g 1000
# pw usermod -n qbittorrent -l System -u 1000 -g 1000
pw groupadd -n media -g 8675309
pw groupmod media -m qbittorrent

# Set permissions and enable service to user/group
sysrc -f /etc/rc.conf qbittorrent_user="qbittorrent"
sysrc -f /etc/rc.conf qbittorrent_group="media"

# Set config directory
sysrc -f /etc/rc.conf qbittorrent_conf_dir="/config"

# Enable qbittorrent
sysrc qbittorrent_enable=YES

# Complete message - Print below text
echo "qBittorrent Successfully Installed"
