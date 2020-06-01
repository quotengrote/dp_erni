# Zurücksetzen eines Cisco Switches
* Zuerst das Stromkabel ziehen.
* Den Switch per Konsolenkabel an einen Laptop mit Serieller Schnittstelle anschließen und per Putty eine Verbindung über die serielle Schnittstelle herstellen.

![https://rmvmlnc0.ausbildung.md/core/preview?fileId=2949&x=1400&y=1050&a=true](https://rmvmlnc0.ausbildung.md/core/preview?fileId=2949&x=1400&y=1050&a=true)
* Das Stromkabel in den Switch stecken und den Mode knopf gedrückt halten. (Unten links am Switch, Vorderseite; Siehe Bild)
  * Der Mode-Knopf kann wieder los gelassen werden, wenn die Lampe mit der Bezeichnung "Sys" durchgehend leuchtet.
  * Dies unterbricht den Boot-Prozess bevor das Betriebssystem gestartet wird.
* Nach einer Weile sollte ein ähnlicher Text wie dieser in Putty ausgegeben werden:
  ```
  Using driver version 1 for media type 1
  Base ethernet MAC Address: (MAC-Adresse)
  Xmodem file system is available.
  The password-recovery mechanism is enabled.
  The system has been interrupted prior to initializing the
  flash filesystem. The following commands will initialize
  the flash filesystem, and finish loading the operating
  system software:
  flash_init
   boot
  switch:
  ```
* Jetzt das Flash-System mit dem Befehl `flash_init` initialisieren.
* Nun die `config.text` löschen. Dazu `del flash:config.text` eingeben und mit `y` bestätigen.
* Danach die `vlan.dat` löschen. Dazu `del flash:vlan.dat` eingeben und mit `y` bestätigen.
* Danach den Switch mit `boot` booten.
* Wenn alles geklappt hat, wurde der Switch erfolgreich auf Werkseinstellungen zurückgesetzt.