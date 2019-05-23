# NZBget for FreeNAS 11.2

This Installation method will create a Jail that is fully configurable via the FreeNAS GUI and CLI (shell)

```
cd /tmp
wget https://raw.githubusercontent.com/kiwilad-nz/freenas-plugin-NZBget/master/NZBget.json
iocage fetch -P dhcp=on vnet=on bpf=yes allow_raw_sockets=1 -n NZBget.json --branch 'master'
```
Await the creation of the Jail.

The config file for NZBget will need the below amended within the Jail:
SSH into the Jail and amend "/usr/local/etc/nzbget.conf" by setting the below:
```
vi /usr/local/etc/nzbget.conf
```
i (insert) | R (overwrite)
```
WebDir=/usr/local/share/nzbget/webui
ConfigTemplate=/usr/local/share/nzbget/nzbget.conf
```
ESC | :wq (this will write and quit vi editor)

Create directories and mount storage as required for further setup of the application via FreeNAS.

```
service nzbget restart
```

NZBget should now be available at http://IP:6789/ | http://nzbget:6789/ (default user/pass: nzbget/tegbzn6789)

