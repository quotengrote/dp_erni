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
#### Nutzermatrix
Gruppe	|Nutzer					| Rollen
----  	|---					|---
User	|					| PVEVMAdmin, PVEDatastoreUser
Admin	|root					| Administrator

#### Namenskonvention Nutzer
- Position 1: u_ oder a_ (__U__ ser oder __A__ dmin)
- Position 2: Nachname (klein)
- Position 3: Vorname (klein)
- Position 4: aufsteigend durch nummerrieren.
##### Beipiel:
__Name:__ Steffi Mustermann
__Nutzernamen:__ u_mustermann_steffi,
		 a_mustermann_steffi
### Rack 1
- Derzeit ohne Funktion

### Rack 2
- Derzeit ohne Funktion

### Namenskonvention Netzwerk
1. Position: R1 oder RM oder R2
2. Position: PH(ysisch) oder VM  oder CO(ntainer)
3. Position: L(inux) oder W(indows)
4. Position: Funktion (ProxMox = pve)
5. Position: Laufende Nummer pro Rack(bei 0 beginnend)
#### Beispiel
R1PHLPVE0.azubi.erni
Rack 1, Physischer Rechner, Linux, ProxMox, Nummer 0

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

## "Best Practises"
- VMs und LXC-Container sollten immer aus dem Base-Image erstellt werden.

## Infos
Der NTP-Server wird nicht in der Schulungsumgebung betrieben.
Quelle ist ein DCF77-Signal.
### IPs
  * 11.8.43.1
  * 11.8.43.2
