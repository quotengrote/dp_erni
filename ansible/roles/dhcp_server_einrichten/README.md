## dhcp-Server einrichten

### Beschreibung
Installiert dnsmasq und lässt ihn dhcp und dns machen.

### Aufgaben
1. stoppt systemd-resolve service auf port 53
1. installiert dnsmasq
1. bearbeitet journalconf und startet journald neu
1. dnsmasq.conf anpasssen und wenn verändert neue conf akzeptieren

### Funktioniert auf
- [x] Ubuntu (>=18.04)

### Variablen + Defaults
see [defaults](./defaults/main.yml)
