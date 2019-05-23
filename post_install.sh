#!/bin/sh

# Create directories and links for mount points etc.
mkdir -p /config /downloads
ln -s /usr/local/bin/python2.7 /usr/bin/python
ln -s /usr/local/bin/python2.7 /usr/bin/python2

# Enable Service
sysrc nzbget_enable=YES
sysrc nzbget_conf_dir=/config
service nzbget restart
