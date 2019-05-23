NZBget for FreeNAS
Requires FreeNAS 11.2
This Installation method will create a Jail that is fully configurable via the FreeNAS GUI from the FreeNas CLI (shell)

cd /tmp
wget https://raw.githubusercontent.com/kiwilad-nz/freenas-plugins/master/NZBget.json
iocage fetch -P dhcp=on vnet=on bpf=yes allow_raw_sockets=1 -n NZBget.json --branch 'master' 
