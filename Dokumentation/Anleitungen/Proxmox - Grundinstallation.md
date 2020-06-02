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
