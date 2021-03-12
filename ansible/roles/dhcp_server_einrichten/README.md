## dhcp-Server einrichten

### Beschreibung
Installiert dnsmasq und lässt ihn dhcp und dns machen.

### Aufgaben
1. stoppt systemd-resolve service auf port 53
1. installiert dnsmasq
1. bearbeitet journalconf und startet journald neu
1. dnsmasq.conf anpasssen und wenn verändert neue conf akzeptieren

### Funktioniert auf
- [x] Ubuntu (>=20.04)

### Variablen + Defaults
see [defaults](./defaults/main.yml)

#### Dictionary Beispiel für dnsmasq.conf:

```yaml
dhcp_ranges: # welche ranges sollen gesetzt werden
  - rangename: "server" # Name der Range, zum beispiel für Server und Clients getrente Ranges oder wenn der DHCP-Server Ranges in verschiedenen subnetzten verteilt.
    netaddress: "192.168.178." # Netzwerkadresse der Range, der Punkt ist entscheident da mit der ersten und letzten Hostadresse zusammen eine IP gebildet wird (Beispiel: {{ netaddress }}{{ firsthostaddress }} -> 192.168.178.5)
    firsthostaddress: "5" # erster vergebener Host in der Range
    lasthostadrdess: "10" # letzter vergebener Host in der Range
    leasetime: "12h" # Leasetime, zum Beispiel 12h für 12 Stunden oder 3m für 3 Minuten
```
