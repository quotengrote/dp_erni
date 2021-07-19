## mgrote.cv4pve

### Beschreibung
Installiert [cv4pve-autosnap](https://github.com/Corsinvest/cv4pve-autosnap).
Legt einen cronjob und das logfile an.

### Funktioniert auf
- [x] ProxMox 6.1

### Variablen + Defaults
##### Version
  cv4pve_version: "v1.9.3"
##### Cron Minute
  cv4pve_cron_minute: "39"
##### Cron Stunde
  cv4pve_cron_hour: "5"
##### API-Token (vorher erstellen)
  cv4pve_api_token: "XXXXXXXXXXXXXXXXXXXXXX"
##### API-User (vorher erstellen)
  cv4pve_api_user: "root@pam!test2"
##### VMs
  cv4pve_vmid: all
##### Anzahl Snpshots zum aufheben
  cv4pve_keep_snapshots: 3
