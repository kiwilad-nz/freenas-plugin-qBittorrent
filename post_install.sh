#!/bin/sh

# Create directories
mkdir -p /config /downloads

# Link scripts
ln -s /usr/local/bin/python2.7 /usr/bin/python
ln -s /usr/local/bin/python2.7 /usr/bin/python2

# Add System user
pw group add -n Admin -g 1000
pw user add System -u 1000 -g 1000 -d /nonexistent -s /usr/bin/nologin

# Set permissions
chmod 555 /etc/rc.d/nzbget

# Set permissions
chown -R Admin:System /usr/local/share/nzbget
sysrc nzbget_user=System
sysrc nzbget_group=Admin

# Set config directory
sysrc nzbget_conf_dir=/config

# Enable nzbget
sysrc nzbget_enable=YES
