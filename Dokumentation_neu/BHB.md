# Gesamtdokumentation "Schulungsumgebung Magdeburg" aka "ERNI0.1"

<!-- TOC depthFrom:1 depthTo:3 withLinks:1 updateOnSave:1 orderedList:0 -->

- [Gesamtdokumentation "Schulungsumgebung Magdeburg" aka "ERNI0.1"](#gesamtdokumentation-schulungsumgebung-magdeburg-aka-erni01)
	- [Allgemeines](#allgemeines)
		- [Beteiligte Personen](#beteiligte-personen)
		- [Zugangsdaten](#zugangsdaten)
	- [Aufbau Rechenraum](#aufbau-rechenraum)
		- [Racks](#racks)
	- [Netzwerk](#netzwerk)
		- [Namenskonvention](#namenskonvention)
		- [IP-Addressplan](#ip-addressplan)
	- [Physische Maschinen](#physische-maschinen)
		- [Proxmox - VM Hosts](#proxmox-vm-hosts)
	- [Virtuelle Maschinen](#virtuelle-maschinen)
		- [BaseImage](#baseimage)
		- [Apt-Cacher-NG](#apt-cacher-ng)
		- [NTP Server](#ntp-server)
		- [Ubuntu Server](#ubuntu-server)

<!-- /TOC -->

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


## "Best Practises"
- VMs und LXC-Container sollten immer aus dem Base-Image erstellt werden

| :point_up:    | Folgt später! |
|---------------|:--------------|
|  | Das Base-Image wird mit eine ansible-playbook generiert(base.yml) |










### NTP Server
#### NTP Server IPs
* DCF77 Signal
#### IPs
  * 11.8.43.1
  * 11.8.43.2
