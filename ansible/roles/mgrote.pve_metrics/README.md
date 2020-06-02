## mgrote.pve_metrics

### Beschreibung
Aktiviert den Export von proxmox-internen Metriken an InfluxDB.


### getestet auf
- [ ] Ubuntu (>=18.04)
- [ ] Debian

- [x] ProxMox 6.1

### Variablen + Defaults
##### InfluxDB FQDN
- Hier wenn moeglich die IP verwenden statt den FQDN da PVE alle 10 Sekunden 4 DNS-Queries schickt.

telegraf_influxdb_srv_fqdn: 192.168.2.147 #
##### InfluxDB Port - ist Pflichtangabe
telegraf_influxdb_srv_port: 8086

## Siehe auch
* [[https://pve.proxmox.com/wiki/External_Metric_Server]]
