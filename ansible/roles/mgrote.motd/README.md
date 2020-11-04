## mgrote.motd

### Beschreibung
Konfiguriert die "Message of the Day"(MOTD)
#### Beispiel:
```

--------------------------------------------------------------------------------
                       This system is managed by Ansible
--------------------------------------------------------------------------------
Q:      Why haven't you graduated yet?
A:      Well, Dad, I could have finished years ago, but I wanted
        my dissertation to rhyme.
--------------------------------------------------------------------------------
FQDN:                 test.ausbildung.md
Distro:               Ubuntu 18.04 bionic
Virtual:              YES
Virtualization Type:  lxc
Uptime:               up 1 day, 2 hours, 56 minutes

```

Es gibt folgende Konfigurationsmoeglichkeiten:
- mit/ohne Wetter
- mit/ohne "fortune"


### Funktioniert auf
- [x] Ubuntu (>=18.04)
- [ ] Debian
- [ ] ProxMox 6.1 <-- funktioniert nicht

### Variablen + Defaults
##### Ort fuer Wetterangabe
motd_wetter_ort: "Magdeburg"
##### Wetter anzeigen?
motd_wetter_aktiv: false
##### "fortune" anzeigen
motd_fortune_aktiv: true
