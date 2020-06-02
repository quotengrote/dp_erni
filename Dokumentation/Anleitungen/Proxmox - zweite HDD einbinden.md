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
