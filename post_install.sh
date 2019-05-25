#!/bin/sh

# Create directories
mkdir -p /config /downloads

# Modify installed user emby (989:989) tp match constant UID/GID from other plugins (1000:1000)
pw groupmod qbittorrent -n qbittorrent -g 1000
pw usermod qbittorrent -n qbittorrent -u 1000 -g 1000

# Set permissions and enable service to user/group
sysrc qbittorrent_user=qbittorrent
sysrc qbittorrent_group=qbittorrent

# Set config directory
sysrc qbittorrent_conf_dir=/config

# Enable qbittorrent
sysrc qbittorrent_enable=YES

# Complete message - Print below text
echo "Please open the URL to continue to Configure qBittorrent (user: admin, Password: adminadmin)."

# Start qBittorrent
service qbittorrent start 2>/dev/null
