# Gesamtdokumentation "Schulungsumgebung Magdeburg" aka "ERNI0.1"

## Allgemeines
### Zugangsdaten
* sind in einer KeePass-Datenbank hinterlegt
    * [Kennwörter.kdbx](./Zugangsdaten/Kennwörter.kdbx)

## Aufbau Rechenraum
### Racks
| Rack 1                                   	| Rack Management                                	| Rack 2                                      	|
|------------------------------------------	|------------------------------------------------	|---------------------------------------------	|
| vSrv1Srv2<br>Sto1<br>Sto2 	| Srv1<br>Srv2<br>Konsole<br>TTY<br>Sto1<br>Sto2 	| Srv1<br>Srv2<br>Sto1<br>Sto2 	|


#### Nutzermatrix
siehe Keepass.

### Rack 1
- Derzeit ohne Funktion

### Rack 2
- Derzeit ohne Funktion

### Namenskonvention Netzwerk
```
1. Position: B(asis)/S(chulung)/T(est)
2. Position: L(inux)/W(indows)/A(ppliance)
3-6. Position: Bezeichnung
7-9. Position: Laufende Nummer
```



B/S/T/P - Basisdienst oder Schulung oder Test oder Produktion
L/W/A - Linux/Windows/Appliance
4-Stellen Bezeichnung - z.B. dnsm
3-Stellige Nummer - 001
#### Beispiel
R1PHLPVE1.ausbildung.md
Rack 1, Physischer Rechner, Linux, ProxMox, Nummer 0

### IP-Addressplan
* Netz: 11.10.31.0/24
* VLAN 45
* Gateway: 11.10.31.254
* Proxy: 11.8.108.254:8080

#### Vergaberegeln
* 0-5 bleiben Frei
* 6-50 - Server(Händisch/Ansible)
* 51-200 DHCP
* 201-254 Spielwiese (Händisch)

## "Best Practises"
- VMs und LXC-Container sollten immer aus dem Base-Image erstellt werden.
