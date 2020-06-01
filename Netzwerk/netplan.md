# netplan

* configuration file unter:

> /etc/netplan/

* Dateien müssen mit .yaml enden!

* Dateien müssen gültiges YAML darstellen...

  * [YAML Tester](https://yamlchecker.com/)

  * Einrückungen(engl. indentations) sind extrem wichtig!

    * am besten mit vi/vim editieren(setzt automatisch die Tabs und prüft die syntax)
#### Renderer:

* networkd -> nur cli

* NetworkManager -> GUI

* Konfiguration testen/übernehmen

  > netplan apply
  >
  > netplan try

## Beispieldatei - static

```
network:
	version: 2
        renderer: networkd
        ethernets:
                ens18:
                        addresses:
                                - 11.10.31.53/24
                        gateway4: 11.10.31.254
                        nameservers:
                                  search: [azubi.erni]
                                  addresses: [10.10.10.1, 1.1.1.1]
```

## Beispieldatei - dynamic

```
network:
  version: 2
  renderer: networkd
  ethernets:
    enp3s0:
      dhcp4: true
```
### Interface up/down
> ip link set enp3s0 up




#### Links

* [Netplan.io](https://netplan.io/examples)

* [Netplan deaktivieren](https://wiki.ubuntuusers.de/Netplan/Deaktivieren/)
