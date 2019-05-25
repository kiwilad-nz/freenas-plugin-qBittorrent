#!/bin/sh

# Create directories
mkdir -p /config /downloads

# Modify installed user qbitorrent (989:989) tp match System:Admin UID:GID from FreeNAS (1000:1000)
pw groupmod -n qbittorrent -l Admin -g 1000
pw usermod -n qbittorrent -l System -u 1000 -g 1000

# Set permissions and enable service to user/group
sysrc qbittorrent_user=System
sysrc qbittorrent_group=Admin

# Set config directory
sysrc qbittorrent_conf_dir=/config

# Enable qbittorrent
sysrc qbittorrent_enable=YES

# Start qBittorrent
service qbittorrent start

# Complete message - Print below text
echo "Please open the URL to continue to Configure qBittorrent (user: admin, Password: adminadmin)."
