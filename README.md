# qBittorrent for FreeNAS 11.2
This Installation method will create a Plugin that is fully configurable via the FreeNAS GUI and CLI (shell) Below creates the Jail, installs all dependencies, applications and will mount the pool and directories as required.

NOTE: Edit the pools/directories and user/group to accomodate your setup (mine have been setup to use system:media (1000:1000) for all plugins).
```
#
cd /tmp
wget https://raw.githubusercontent.com/kiwilad-nz/freenas-plugin-qBittorrent/master/qBittorrent.json
iocage fetch -P dhcp=on vnet=on bpf=yes allow_raw_sockets=1 -n qBittorrent.json --branch 'master' --accept
rm /tmp/qBittorrent.json
iocage fstab -a qbittorrent /mnt/RAID6/Apps/qBittorrent /config nullfs rw 0 0
iocage fstab -a qbittorrent /mnt/RAID6/Downloads /downloads nullfs rw 0 0
iocage restart qbittorrent
#
```
Await the creation of the Jail until you have been provided the Admin portal address.

qBittorrent should now be available at http://qBittorrent:8080/ (default user/pass: admin/adminadmin)

