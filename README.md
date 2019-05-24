# NZBget for FreeNAS 11.2

This Installation method will create a Jail that is fully configurable via the FreeNAS GUI and CLI (shell)

Below creates the Jail, installs all applicable applications and will mount the pool and directories as followed.
Below will need to be amended to suit your pool and directory setup.
```
cd /tmp
wget https://raw.githubusercontent.com/kiwilad-nz/freenas-plugin-NZBget/master/NZBget.json
iocage fetch -P dhcp=on vnet=on bpf=yes allow_raw_sockets=1 -n NZBget.json --branch 'master'

iocage fstab -a nzbget /mnt/RAID6/Apps/NZBget /config nullfs rw 0 0
iocage fstab -a nzbget /mnt/RAID6/Downloads /downloads nullfs rw 0 0
```
Await the creation of the Jail.

NZBget should now be available at http://IP:6789/ | http://nzbget:6789/ (default user/pass: nzbget/tegbzn6789)

