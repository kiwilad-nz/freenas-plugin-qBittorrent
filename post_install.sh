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

# Enable Port 80 and redirect to qBittorrent port 8080
echo "net.inet.IP.portrange.reservedhigh=79" >> /etc/sysctl.conf
echo "firewall_enable=YES" >> /etc/rc.conf
echo "ipfw add 100 fwd 127.0.0.1,8080 tcp from any to any 80 in" >> /etc/rc.firewall

# Start qbittorrent
service qbittorrent start

# Complete message - Print below text
echo "qBittorrent Successfully Installed"
