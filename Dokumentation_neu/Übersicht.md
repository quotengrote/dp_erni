# Gesamtdokumentation "Schulungsumgebung Magdeburg" aka "ERNI0.1"

## Allgemeines
### Zugangsdaten
* sind in einer KeePass-Datenbank hinterlegt
    * [Kennwörter.kdbx](./Zugangsdaten/Kennwörter.kdbx)

## Aufbau Rechenraum
### Racks
| Rack 1                                   	| Rack Management                                	| Rack 2                                      	|
|------------------------------------------	|------------------------------------------------	|---------------------------------------------	|
| vSrv1Srv2<br>Sto1<br>Sto2<br>BladeCenter 	| Srv1<br>Srv2<br>Konsole<br>TTY<br>Sto1<br>Sto2 	| Srv1<br>Srv2<br>Sto1<br>Sto2<br>BladeCenter 	|


## Aufbau Software
### "Rack Management"
Auf SRV1 und SRV2 läuft Proxmox in der CE Version.
Beide Server sind als Cluster mit Shared Storage auf der Datadomain 4200(Sto1) eingerichtet.
Auf diesem Cluster laufen die Basisdienste.
Dazu gehören:
	- DHCP dnsmasq
	- DNS aus hostfile mit dnsmasq
	- Apt-Cacher-NG(acng) als Paket Mirror für Debian-basierte OS.

### Rack 1
- Derzeit ohne Funktion

### Rack 2
- Derzeit ohne Funktion


## "Best Practises"
- VMs und LXC-Container sollten immer aus dem Base-Image erstellt werden.

## Infos
Der NTP-Server wird nicht in der Schulungsumgebung betrieben.
Quelle ist ein DCF77-Signal.
### IPs
  * 11.8.43.1
  * 11.8.43.2
