#!/bin/sh

# Create directories
mkdir -p /config /downloads
chown -R Admin:System /config /downloads

# Add system user
pw group add -n Admin -g 1000
pw user add System -u 1000 -g 1000 -d /nonexistent -s /usr/bin/nologin

# Set permissions and enable service to user/group
sysrc qbittorrent_user=System
sysrc qbittorrent_group=Admin

# Download/replace config and set config directory
sysrc qbittorrent_conf_dir=/config

# Enable qbittorrent
sysrc qbittorrent_enable=YES

# Start/Restart qbittorrent
service qbittorrent restart
