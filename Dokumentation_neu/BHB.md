<<<<<<< current
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





## Virtuelle Maschinen
* Linux VM sollten grundsätzlich aus dem BaseImage erstellt werden.
  * Dort sind schon alle passenden Grundeinstellungen wie Paketquellen hinterlegt.

### BaseImage
| :exclamation:  Muss angepasst werden, die .70 ist die MGMT-IP der DataDomain.   |
|-----------------------------------------|
* haben nach dem Klonen immer die 10.10.31.__70__

#### Erstellen
| :point_up:    | Folgt später! |
|---------------|:--------------|
#### Aktualisieren
| :point_up: | Folgt später! |
| ---------- |:------------- |

### Apt-Cacher-NG
* Url für WebGui: http://rmvmlacng0.azubi.erni:9999/acng-report.html
#### Installation
1. `sudo apt install apt-cacher-ng`
6. `sudo nano /etc/apt-cacher-ng/acng.conf`
    > CacheDir: /mnt/apt_omv
    > Port:9999
    > ExThreshold: 60
    > PidFile: /var/run/apt-cacher-ng/pid
    > Proxy: http://11.8.108.254:8080
7. `sudo systemctl enable apt-cacher-ng`
    * systemd-Dienst aktivieren
7. `sudo systemctl start apt-cacher-ng`
8. `sudo systemctl status apt-cacher-ng`
9. `sudo init 6`

#### Clients
##### Beispiel sources.list - Ubuntu 19.04
`sudo nano /etc/apt/sources.list`
proxy pro Repo ergänzen
> deb http://de.archive.ubuntu.com/ubuntu/ eoan main restricted --> deb http://apt-cacher-ng.grote.local:9999/de.archive.ubuntu.com/ubuntu/ eoan main restricted
```
deb http://apt-cacher-ng.grote.local:9999/de.archive.ubuntu.com/ubuntu/ eoan main restricted
deb http://apt-cacher-ng.grote.local:9999/de.archive.ubuntu.com/ubuntu/ eoan-updates main restricted
deb http://apt-cacher-ng.grote.local:9999/de.archive.ubuntu.com/ubuntu/ eoan universe
deb http://apt-cacher-ng.grote.local:9999/de.archive.ubuntu.com/ubuntu/ eoan-updates universe
deb http://apt-cacher-ng.grote.local:9999/de.archive.ubuntu.com/ubuntu/ eoan multiverse
deb http://apt-cacher-ng.grote.local:9999/de.archive.ubuntu.com/ubuntu/ eoan-updates multiverse
deb http://apt-cacher-ng.grote.local:9999/de.archive.ubuntu.com/ubuntu/ eoan-backports main restricted universe multiverse
deb http://apt-cacher-ng.grote.local:9999/security.ubuntu.com/ubuntu eoan-security main restricted
deb http://apt-cacher-ng.grote.local:9999/security.ubuntu.com/ubuntu eoan-security universe
deb http://apt-cacher-ng.grote.local:9999/security.ubuntu.com/ubuntu eoan-security multiverse
```

#### Siehe auch
* https://geekflare.com/create-apt-proxy-on-raspberrypi/
* https://daniel-ziegler.com/linux/computer/2017/09/01/Apt-Cacher-ng-ubuntu/
* https://github.com/Efreak/apt-cacher-ng

### NTP Server
#### NTP Server IPs
* Server steht bei Ingo
* DCF77 Signal
#### IPs
  * 11.8.43.1
  * 11.8.43.2
#### NTP-Server unter Ubuntu mit chrony einrichten
##### Installation
`sudo apt-get install chrony`

##### Konfigurationsdatei
`sudo nano /etc/chrony/chrony.conf`
* minimaler Inhalt
```
server 11.8.43.1        iburst
server 11.8.43.2        iburst
keyfile /etc/chrony/chrony.keys
driftfile /var/lib/chrony/chrony.drift
logdir /var/log/chrony
maxupdateskew 100.0
rtcsync
makestep 1 3
allow 11.10.31/24
```

* Server X.X.X.X gibt die zu befragenden Server an
  * iburst beschleunigt die initiale Synchronisation
* allow X.X.X/XX  ist die Netzadresse auf der chrony als Server "lauschen" soll
  * wichtig ist hier die Subnetzmaske

##### Service neustarten
`sudo systemctl restart chrony.service`

##### rausfinden welche Server befragt werden(Übersicht)
```sudo chrony sources -v```

##### Siehe auch
* [Chrony FAQ](https://chrony.tuxfamily.org/faq.html)

### Ubuntu Server
#### Standardinstallation
##### 1. Installation

* ISO: ubuntu-19.10-server-amd64.iso

* nicht den kompletten Storage der VM zuweisen

* VM-Name = Hostname

  * siehe: [Namenskonvention](#namenskonvention)

* qemu-guest-agent in "Optionen" aktivieren

##### 2. Netzwerkkonfiguration

* Ubuntu nutzt netplan

  * `etc/network/interfaces` wird nicht mehr verwendet

* Hostname setzen

  * entweder im Setup oder mit `sudo hostname <neuer_Hostname>`

###### netplan einrichten

`sudo vi /etc/netplan/00-static.yaml`

* es können mehrere Dateien angelegt werden, die mit der niedrigsten Nummer wird verwendet

* Dateien müssen gültiges YAML darstellen...

  * [YAML Tester](https://yamlchecker.com/)

  * Einrückungen(engl. indentations) sind extrem wichtig!

    * am besten mit vi/vim editieren(setzt automatisch die Tabs und prüft die Syntax)

* Inhalt:

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
                                  addresses: [11.10.31.53]

Konfiguration übernehmen

* `sudo netplan --debug apply`

Neustart

* `sudo init 6`

##### 3. Testen


1. ping AUF ip im internen Netzwerk
2. ping VON ip im internen Netzwerk
5. Namensauflösung intern testen

  ```dig <interner_hostname.azubi.erni>```


##### Repository - Apt-Cacher-NG setzen
`sudo nano /etc/apt/sources.list`
proxy pro Repo ergänzen

deb http://de.archive.ubuntu.com/ubuntu/ eoan main restricted --> deb http://rmvmlacng0.azubi.erni:9999/de.archive.ubuntu.com/ubuntu/ eoan main restricted


##### Testen

* `ping <lokale_ip>`

* `ping <lokaler_hostname>` (dauert lange)

* `dig <lokaler_hostname>`

* `ping <8.8.8.8>`

* `wget <internet_url>`

* `sudo apt-get update`

##### Programme und Updates

* `apt update && apt upgrade -y && apt install git dnsutils nano htop mc netdiscover tmux tree qemu-guest-agent curl ncdu net-tools sysstat restic -y && apt autoremove`
=======
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
### Beteiligte Personen
#### Betreuer/Ausbilder
- Ingo Trelewska
- Peter Seidel
#### Auszubildende
- Daniel Müller
- Maximilian Steinberg
- Sebastian Kaiser
- Michael Grote
### Zugangsdaten
* sind in einer KeePass-Datenbank hinterlegt
    * [Kennwörter.kdbx](./Zugangsdaten/Kennwörter.kdbx)

## Aufbau Rechenraum
### Racks
| R1                                          	| RM                                          	| R2                                             	|   	|   	|
|---------------------------------------------	|---------------------------------------------	|------------------------------------------------	|---	|---	|
| Srv1<br>Srv2<br>Sto1<br>Sto2<br>BladeCenter 	| Srv1<br>Srv2<br>Sto1<br>Sto2<br>BladeCenter 	| Srv1<br>Srv2<br>Konsole<br>TTY<br>Sto1<br>Sto2 	|   	|   	|

## Physische Maschinen
### Proxmox - VM Hosts
#### Standardinstallation
* von IPMI Booten/ISO einbinden
##### Netzwerkkonfiguration
* IP, Gateway und DNS-Server werden bei der Installation eingerichtet
  * falls nicht /etc/network/interfaces bearbeiten
    * [UbuntuUsers](https://wiki.ubuntuusers.de/interfaces/)
  * Unter "VM" -> System -> DNS lassen sich die DNS Einstellungen auch nochmal anpassen

##### testen
1. ping AUF ip im internen Netzwerk
2. ping VON ip im internen Netzwerk
5. Namensauflösung intern testen

`dig <interner_hostname.azubi.erni>`

##### proxy systemweit setzen(außer apt)
`nano /etc/environment`

##### Inhalt
```
http_proxy="http://11.8.108.254:8080/"
https_proxy="http://11.8.108.254:8080/"
no_proxy="localhost,127.0.0.1,11.10.31.*, *.azubi.erni"
```
##### Neustart
`init 6`

##### apt konfigurieren
* [Link](https://pve.proxmox.com/wiki/Package_Repositories#_proxmox_ve_no_subscription_repository)

##### Inhalt
`/etc/apt/sources.list.d/pve-enterprise.list`
Enterprise-Repository mit '#' auskommentieren
##### Testen
* `ping <lokale_ip>`
* `ping <lokaler_hostname>` (dauert lange)
* `dig <lokaler_hostname>`
* `ping <internet_ip>`
* `wget <internet_url>`
* `sudo apt-get update`

`apt update && apt upgrade -y && apt install git dnsutils nano htop mc netdiscover tmux tree qemu-guest-agent curl ncdu net-tools sysstat restic -y`

#### Hostname ändern

https://pve.proxmox.com/wiki/Renaming_a_PVE_node

Rename a standalone PVE host, you **need** to edit:

* /etc/hosts

* /etc/hostname

In the above files replace all occurrences of the *old name* with the **new one**. Ensure that /etc/hosts has an entry with the hostname mapped to the IP you want to use as main IP address for this node.

There are other files which you may want to edit, they are not important for the functions of Proxmox VE itself.

* /etc/mailname

* /etc/postfix/main.cf

If your node is in a cluster, where it is not recommended to change its name, adapt /etc/pve/corosync.conf so that the nodes name is changed also there. See <https://pve.proxmox.com/pve-docs/chapter-pvecm.html#edit-corosync-conf>
#### Backups von VM
In
`/var/lib/vz/dump`

können per scp heruntergeladen werden

`scp root@11.10.31.51:/var/lib/vz/dump/vzdump-qemu-101-2019_11_08-13_41_42.vma.lzo /home/mg/vzdump-qemu-101-2019_11_08-13_41_42.vma.lzo`

#### pve als NTP-Client einrichten
`nano /etc/systemd/timesyncd.conf`
Inhalt:
`[Time]
NTP=<NTP-SERVERNAME>`
Dienst neustarten
`systemctl restart systemd-timesyncd`
prüfen ob Abfrage funktioniert
`journalctl --since -1h -u systemd-timesyncd`
prüfen ob Uhrzeit passt und ntp-service aktiv ist
`timedatectl `

#### Cluster erstellen

##### Vo­r­aus­set­zung
1. DNS-Namensauflösung muss intern funktionieren
2. NTP-Server muss im internen Netz funktionieren
  1. [NTP-Server muss in pve eingerichtet sein](#pve als NTP-Client einrichten)

  | :warning: WARNING          |
|:---------------------------|
| Link Kaputt, oben drüber!      |
3. Für ein HA Cluster müssen es mindestens 3 Server sein  
4. Empfohlen: 2. NIC nur für Clusterverkehr(corosync)
   Cave: Changing the hostname and IP is not possible after cluster creation.

* Falls schon VMs existieren, sollte der Server auf dem dieses laufen, der Server sein von dem aus der Cluster erstellt wird, da auf den joinenden Clustern die Daten gelöscht werden.

Ablauf
2. NIC konfigurieren
3. alle IPs müssen im DNS stehen

##### Erstellen
`pvecm create CLUSTERNAME -link0 <ip>`
* Link0 ist die NIC über die der Corosyncverkehr laufen soll

When adding a node to a cluster with a separated cluster network you need to use the link0 parameter to set the nodes address on that network:

`pvecm add IP-ADDRESS-CLUSTER -link0 <ip>`


Status: `pvecm status`

##### Siehe auch
* [PVE Wiki](https://pve.proxmox.com/wiki/Cluster_Manager)

#### zweite HDD einbinden
Es kann durchaus sinnvoll sein, eine weitere Festplatte, z.B. für ISO-Dateien, bei der Virtualisierungslösung Proxmox VE, jenseits des regulären Storages einzubinden. Anbei die notwendigen Schritte.
Hinweis: Nachfolgende Anleitung ist stichpunktartig verfasst!
An der lokalen Konsole oder via ssh folgende Befehle ausführen:
#### Festplatte partitionieren
 > fdisk /dev/sdb

 > nQ

 > p

 > 1

 > Zweimal Enter (Erster/Letzter Zylinder/Größe)

 > w

#### Festplatte mit ext3 formatieren
 > mkfs.ext3 /dev/sdb1
#### Festplatte einhängen (mounten)
 > mkdir /mnt/sdb1
 > mount /dev/sdb1 /mnt/sdb1
__Damit die zweite Festplatte auch nach einem Neustart zur Verfügung steht, muss die Datei „fstab“ editiert werden:__
`nano /etc/fstab`
Folgende Zeile einfügen bzw. eine ggf. vorhandene Zeile entsprechend abändern:
> /dev/sdb1 /mnt/sdb1 ext3 defaults 0 1

#### Festplatte im Web-Interface konfigurieren

- Am Web-Interface anmelden.
- „Datacenter“ auswählen.
- Zur Registerkarte „Storage“ wechseln.
- Auf „Add – Directory“ klicken.
- Unter „ID“ einen Namen vergeben.
- Bei „Directory“ „/mnt/sdb1“ eintragen.
- Unter „Content“ auswählen, was auf der zweiten HDD gespeichert wird. Eine Mehrfachauswahl, z.B. Images und ISO, ist möglich.

#### Siehe auch
* https://www.andysblog.de/proxmox-ve-2-x-zweite-festplatte-einbinden

## Virtuelle Maschinen
* Linux VM sollten grundsätzlich aus dem BaseImage erstellt werden.
  * Dort sind schon alle passenden Grundeinstellungen wie Paketquellen hinterlegt.

### BaseImage
| :exclamation:  Muss angepasst werden, die .70 ist die MGMT-IP der DataDomain.   |
|-----------------------------------------|
* haben nach dem Klonen immer die 10.10.31.__70__

#### Erstellen
| :point_up:    | Folgt später! |
|---------------|:--------------|
#### Aktualisieren
| :point_up: | Folgt später! |
| ---------- |:------------- |

### Apt-Cacher-NG
* Url für WebGui: http://rmvmlacng0.azubi.erni:9999/acng-report.html
#### Installation
1. `sudo apt install apt-cacher-ng`
6. `sudo nano /etc/apt-cacher-ng/acng.conf`
    > CacheDir: /mnt/apt_omv
    > Port:9999
    > ExThreshold: 60
    > PidFile: /var/run/apt-cacher-ng/pid
    > Proxy: http://11.8.108.254:8080
7. `sudo systemctl enable apt-cacher-ng`
    * systemd-Dienst aktivieren
7. `sudo systemctl start apt-cacher-ng`
8. `sudo systemctl status apt-cacher-ng`
9. `sudo init 6`

#### Clients
##### Beispiel sources.list - Ubuntu 19.04
`sudo nano /etc/apt/sources.list`
proxy pro Repo ergänzen
> deb http://de.archive.ubuntu.com/ubuntu/ eoan main restricted --> deb http://apt-cacher-ng.grote.local:9999/de.archive.ubuntu.com/ubuntu/ eoan main restricted
```
deb http://apt-cacher-ng.grote.local:9999/de.archive.ubuntu.com/ubuntu/ eoan main restricted
deb http://apt-cacher-ng.grote.local:9999/de.archive.ubuntu.com/ubuntu/ eoan-updates main restricted
deb http://apt-cacher-ng.grote.local:9999/de.archive.ubuntu.com/ubuntu/ eoan universe
deb http://apt-cacher-ng.grote.local:9999/de.archive.ubuntu.com/ubuntu/ eoan-updates universe
deb http://apt-cacher-ng.grote.local:9999/de.archive.ubuntu.com/ubuntu/ eoan multiverse
deb http://apt-cacher-ng.grote.local:9999/de.archive.ubuntu.com/ubuntu/ eoan-updates multiverse
deb http://apt-cacher-ng.grote.local:9999/de.archive.ubuntu.com/ubuntu/ eoan-backports main restricted universe multiverse
deb http://apt-cacher-ng.grote.local:9999/security.ubuntu.com/ubuntu eoan-security main restricted
deb http://apt-cacher-ng.grote.local:9999/security.ubuntu.com/ubuntu eoan-security universe
deb http://apt-cacher-ng.grote.local:9999/security.ubuntu.com/ubuntu eoan-security multiverse
```

#### Siehe auch
* https://geekflare.com/create-apt-proxy-on-raspberrypi/
* https://daniel-ziegler.com/linux/computer/2017/09/01/Apt-Cacher-ng-ubuntu/
* https://github.com/Efreak/apt-cacher-ng

### NTP Server
#### NTP Server IPs
* Server steht bei Ingo
* DCF77 Signal
#### IPs
  * 11.8.43.1
  * 11.8.43.2
#### NTP-Server unter Ubuntu mit chrony einrichten
##### Installation
`sudo apt-get install chrony`

##### Konfigurationsdatei
`sudo nano /etc/chrony/chrony.conf`
* minimaler Inhalt
```
server 11.8.43.1        iburst
server 11.8.43.2        iburst
keyfile /etc/chrony/chrony.keys
driftfile /var/lib/chrony/chrony.drift
logdir /var/log/chrony
maxupdateskew 100.0
rtcsync
makestep 1 3
allow 11.10.31/24
```

* Server X.X.X.X gibt die zu befragenden Server an
  * iburst beschleunigt die initiale Synchronisation
* allow X.X.X/XX  ist die Netzadresse auf der chrony als Server "lauschen" soll
  * wichtig ist hier die Subnetzmaske

##### Service neustarten
`sudo systemctl restart chrony.service`

##### rausfinden welche Server befragt werden(Übersicht)
```sudo chrony sources -v```

##### Siehe auch
* [Chrony FAQ](https://chrony.tuxfamily.org/faq.html)

### Ubuntu Server
#### Standardinstallation
##### 1. Installation

* ISO: ubuntu-19.10-server-amd64.iso

* nicht den kompletten Storage der VM zuweisen

* VM-Name = Hostname

  * siehe: [Namenskonvention](#namenskonvention)

* qemu-guest-agent in "Optionen" aktivieren

##### 2. Netzwerkkonfiguration

* Ubuntu nutzt netplan

  * `etc/network/interfaces` wird nicht mehr verwendet

* Hostname setzen

  * entweder im Setup oder mit `sudo hostname <neuer_Hostname>`

###### netplan einrichten

`sudo vi /etc/netplan/00-static.yaml`

* es können mehrere Dateien angelegt werden, die mit der niedrigsten Nummer wird verwendet

* Dateien müssen gültiges YAML darstellen...

  * [YAML Tester](https://yamlchecker.com/)

  * Einrückungen(engl. indentations) sind extrem wichtig!

    * am besten mit vi/vim editieren(setzt automatisch die Tabs und prüft die Syntax)

* Inhalt:

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
                                  addresses: [11.10.31.53]

Konfiguration übernehmen

* `sudo netplan --debug apply`

Neustart

* `sudo init 6`

##### 3. Testen


1. ping AUF ip im internen Netzwerk
2. ping VON ip im internen Netzwerk
5. Namensauflösung intern testen

  ```dig <interner_hostname.azubi.erni>```


##### Repository - Apt-Cacher-NG setzen
`sudo nano /etc/apt/sources.list`
proxy pro Repo ergänzen

deb http://de.archive.ubuntu.com/ubuntu/ eoan main restricted --> deb http://rmvmlacng0.azubi.erni:9999/de.archive.ubuntu.com/ubuntu/ eoan main restricted


##### Testen

* `ping <lokale_ip>`

* `ping <lokaler_hostname>` (dauert lange)

* `dig <lokaler_hostname>`

* `ping <8.8.8.8>`

* `wget <internet_url>`

* `sudo apt-get update`

##### Programme und Updates

* `apt update && apt upgrade -y && apt install git dnsutils nano htop mc netdiscover tmux tree qemu-guest-agent curl ncdu net-tools sysstat restic -y && apt autoremove`
>>>>>>> before discard
