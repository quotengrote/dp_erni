## mgrote.smart

### Beschreibung
Installiert und konfiguriert smartmontools + Mail-Benachrichtigungen.
Es laesst sich konfigurieren wann die kompletten SMART-Werte versendet werden.

### Funktioniert auf
- [ ] Ubuntu (>=18.04)
- [ ] Debian

- [ ] ProxMox 6.1

### Variablen + Defaults
##### Wer soll die Mail bekommen
empfaenger_mail: michael.grote@posteo.de
##### Wann sollen die SMART-Werte verschickt werden.(Minuten)
smart_smartctlmail_cron_minutes
##### Wann sollen die SMART-Werte verschickt werden.(Stunden)
smart_smartctlmail_cron_hours
##### Wann sollen die SMART-Werte verschickt werden.(Wochentag)
smart_smartctlmail_cron_weekday
##### Pfad zu smartctl
telegraf_smart_pfad_zu_smartctl: "/usr/sbin/smartctl"
