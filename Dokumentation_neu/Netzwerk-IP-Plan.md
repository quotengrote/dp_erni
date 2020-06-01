### IP-Addressplan
* Netz: 11.10.31.XX/24
* VLAN 45
* Gateway: 11.10.31.254
* Proxy: 11.8.108.254:8080
#### Vergaberegeln
* 0-5 bleiben Frei
* 6-50 - Clients(werden per DHCP verteilt)
* 101-160 - R1
* 50-100 - RM
* 180-240 - R2

* Aus dem [BaseImage](#baseimage) geklonte Server haben immer die 11.10.31.__70__

#### Einzelne Adressen
* siehe [Excel](./Netzwerk/IP-Hosts.xlsx)
