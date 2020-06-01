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
                                  search: [ausbildung.md]
                                  addresses: [11.10.31.53]

Konfiguration übernehmen

* `sudo netplan --debug apply`

Neustart

* `sudo init 6`

##### 3. Testen


1. ping AUF ip im internen Netzwerk
2. ping VON ip im internen Netzwerk
5. Namensauflösung intern testen

  ```dig <interner_hostname.ausbildung.md>```


##### Repository - Apt-Cacher-NG setzen
`sudo nano /etc/apt/sources.list`
proxy pro Repo ergänzen

deb http://de.archive.ubuntu.com/ubuntu/ eoan main restricted --> deb http://rmvmlacng0.ausbildung.md:9999/de.archive.ubuntu.com/ubuntu/ eoan main restricted


##### Testen

* `ping <lokale_ip>`

* `ping <lokaler_hostname>` (dauert lange)

* `dig <lokaler_hostname>`

* `ping <8.8.8.8>`

* `wget <internet_url>`

* `sudo apt-get update`

##### Programme und Updates

* `apt update && apt upgrade -y && apt install git dnsutils nano htop mc netdiscover tmux tree qemu-guest-agent curl ncdu net-tools sysstat restic -y && apt autoremove`
