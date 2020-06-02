#### Windows auf PVE installieren

Für eine Optimale Geschwindigkeit muss die VM vor dem Starten Konfiguriert werden.
Wir installieren hierführ die VirtIO Treiber und den Gast Agent
Links:
[VirtIO.iso](https://pve.proxmox.com/wiki/Windows_10_guest_best_practices)
[Qemu-guest-agent](https://pve.proxmox.com/wiki/Qemu-guest-agent)
[Firewall](https://www.it-administrator.de/themen/server_client/300310.html)

1. Erstelle eine neue VM, Typ: ___"Microsoft Windows"___ , Version: ___10/2016/2019"___ als Gast __OS__ und erlaube ___"Qemu Agent"___ im __System__ tab.
2. Binde die Win10.iso als neue DVD/CD ein.
2.1 Falls sich die Iso nicht hochladen lässt scp-Befehl benutzen mit richtigen Pfad. (/mnt/pve/RM_DD_NFS_PVE_CLUSTER/template/iso) RM_DD_NFS_PVE_CLUSTER - Beliebiges in PVE eingebundenes Storage/Laufwerk
3. Für das __Laufwerk__ wähle ___"SCSI"___ als __Bus/Device__ mit ___"VirtIO SCSI"___ als Controller und ___"Write back"___ als __Cache__ Option für bessere Performance (the No cache default is safer, but slower)
4. Konfiguriere die __CPU__ und den __Speicher__ wie benötigt.
5. Gehe weiter und setze  ___"VirtIO (paravirtualized)"___ als __Modell__ und schließe die Einrichtung ab.
6. Für die VirtIO Treiber lade die Treiber (Stable Version) zum  ISO Storage von Proxmox hoch und erstelle ein neues CDROM Laufwerk in welches dann die ___"VirtIO.iso"___ eingelegt wird. (use "Add -> CD/DVD drive" in the hardware tab) stelle als __Bus__ ___"IDE"___ und als Zahl ___"3"___ ein.
7. Der Windows Installation folgen bis zur auswahl des Laufwerkes
8. Auf __Treiber Laden__ klicken falls kein Laufwerk vorhanden und die Treiber von VirtIO installieren.

Hard disk: "vioscsi\w10\amd64" ("Red Hat VirtIO SCSI pass-through controller")
Network: "NetKVM\w10\amd64" ("Redhat VirtIO Ethernet Adapter")
Memory Ballooning: "Balloon\w10\amd64" ("VirtIO Balloon Driver")

9. Installation abschließen
10. Quemu Gast Agent installieren
10.1 Öffne den __Geräte-Manager__
10.2 Prüfen ob alle Treiber installiert sind.
10.3 Starte den Quemu-guest-agent installer (.msi) auf den gemounteten CDROM-Laufwerk mit der VirtIO.iso
10. Ping Testen
11. Falls kein Ping möglich (Zeitüberschreitung) Firewall anpassen
11.1. Systemsteuerung > System und Sicherheit > Windows Defender Firewall > Erweiterte Einstellungen > Eingehenden Regeln
11.2. __Datei- und Druckfreigabe (Echoanforderung - ICMPv4 eingehend)__ anklicken und im Tab __Allgemein__ Hacken bei __Aktivieren__
