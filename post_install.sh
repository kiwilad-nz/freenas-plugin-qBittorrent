#!/bin/sh

# Create directories
mkdir -p /config /downloads

# Link scripts
ln -s /usr/local/bin/python2.7 /usr/bin/python
ln -s /usr/local/bin/python2.7 /usr/bin/python2

# Add system user
pw group add -n Admin -g 1000
pw user add System -u 1000 -g 1000 -d /nonexistent -s /usr/bin/nologin

# Set permissions
# chmod 555 /etc/rc.d/nzbget

# Set permissions and enable service to user/group
chown -R Admin:System /usr/local/share/nzbget
sysrc nzbget_user=System
sysrc nzbget_group=Admin

# Download/replace config and set config directory
rm /usr/local/etc/nzbget.conf
wget -P /usr/local/etc/ https://raw.githubusercontent.com/kiwilad-nz/freenas-plugin-NZBget/master/nzbget.conf
sysrc nzbget_conf_dir=/config

# Enable nzbget
sysrc nzbget_enable=YES
