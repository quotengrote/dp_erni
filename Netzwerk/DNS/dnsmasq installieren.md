# dnsmasq aufsetzen

> sudo apt-get install dnsmasq

* Auflösung in /etc/hosts definieren

  * Siehe Excel

* /etc/resolv.conf (öffnen)

  > nameserver 127.0.0.1 (ändern)

  > nameserver DNS_SERVER_DRAUSSEN/IM INTERNET

#### Dnsmasq als DNS-Server für andere Rechner im lokalen Netz

* /etc/dnsmasq.conf

  > listen-address=127.0.0.1 listen-address=IP_INTERFACE_ZUM_LAN/NETZWERKKARTE_DIE_ZUM_LAN_ZEIGT

* Neustarten:

  > sudo service dnsmasq restart

* Testen:

  > sudo netstat -tulpen | grep dnsmasq

* netstat liegt unter Ubuntu im Paket "net-tools"; nicht netstat-nat

#### Probleme mit systemd-resolvd "failed to create listening socket..."

* /etc/systemd/resolved.conf

  `DNSStubListener=no` hinzufügen bzw. auskommentieren

  > sudo systemctl restart systemd-resolved

#### Weitere Probleme

* unter Ubuntu muss systemd-resolved deaktiviert werden

> sudo systemctl disable systemd-resolved sudo systemctl stop systemd-resolved

Danach kann die /etc/resolv.conf leer bzw. gelöscht bzw. als symbolischer Link vorhanden sein -> dann neu erstellen

#### Links

* [LinuxWiki](https://linuxwiki.org/dnsmasq)

* [UbuntuUsers](https://wiki.ubuntuusers.de/Dnsmasq/)