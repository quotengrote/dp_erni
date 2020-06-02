## mgrote.zfs_tools

### Beschreibung
Aktiviert die Mail Funktion von ZED (ZFS Event Daemon).
Setzt die maximale ARC-Groesse.
Benoetigt "mgrote.postfix-gmail".
Richtet regelmaessige Scrubs(jeden Sonntag) und Trim(alle 4 Monate) ein.
Richtet "zfs_health.sh", ein ZFS-Checkscript das auch Mails versendet bei Fehlern.

### getestet auf
- [ ] Ubuntu (>=18.04)
- [ ] Debian

- [x] ProxMox 6.1

### Variablen + Defaults
##### Wer soll die Mails bekommen
empfaenger_mail: michael.grote@posteo.de
##### name des zu ueberwachenden Pools -
- [ ] pruefen ob auch mehrere Pools gehen
zfs_pool: zfs_vm_mirror
##### Maximale Groesse ARC in Bytes
Beim aendern wird die Zeile einmal mit dem alten Wert und dem neuen Wert in die Zeile eingefuegt!
zfs_arc_max: "8589934592"
Die aenderung der maximalen ARC-Size wird erst nach einem Neustart uebernommen.
##### Ausfuehrung des ZFS_health-Scripts in Minuten
alle 5 Minuten =
cron_minutes_zfs_health: "5,10,15,20,25,30,35,40,45,50,55"
##### Poolauflistung + Parameter
- u.A. fuer Cron fuer Trim und Scrub
Alle 4 Monate am 2. des Monats um 23:12
``- { name: "zfs_single_hdd", cron_minute_zfs_trim: "12", cron_hour_zfs_trim: "23", cron_month_zfs_trim: "4,8,12", cron_day_zfs_trim: "3", cron_weekday_zfs_scrub: "0", cron_minutes_zfs_scrub: "0", cron_hour_zfs_scrub: "5"}``
Erst Poolname
Trim: Minute, Stunde, Monat, Tag des Monats
Scrub: Wochentag, Minute, Stunde
##### Pfad zu zpool-binary
pfad_zu_zpool: "/usr/sbin/zpool"
