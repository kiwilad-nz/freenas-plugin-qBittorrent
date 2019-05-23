NZBget for FreeNAS
Requires FreeNAS 11.2
This Installation method will create a Jail that is fully configurable via the FreeNAS GUI from the FreeNas CLI (shell)

```
cd /tmp
wget https://raw.githubusercontent.com/kiwilad-nz/freenas-plugin-NZBget/master/NZBget.json
iocage fetch -P dhcp=on vnet=on bpf=yes allow_raw_sockets=1 -n NZBget.json --branch 'master'
```

The config file for NZBget will need the below ammended:
Open "/usr/local/etc/nzbget.conf" and set the below WITHOUT QUOTES:
```
vi /usr/local/etc/nzbget.conf
```
i - insert
R - overwrite
:wq - write and quit
```
WebDir=/usr/local/share/nzbget/webui
ConfigTemplate=/usr/local/share/nzbget/nzbget.conf
```
NZBget should be available at http://<JailIP>:6789/ or http://nzbget:6789/ (default user/pass: nzbget/tegbzn6789)

