#### NTP-Server unter Ubuntu mit chrony einrichten
##### Installation
`sudo apt-get install chrony`

##### Konfigurationsdatei
`sudo nano /etc/chrony/chrony.conf`
* minimaler Inhalt
```
server 11.8.43.1        iburst
server 11.8.43.2        iburst
keyfile /etc/chrony/chrony.keys
driftfile /var/lib/chrony/chrony.drift
logdir /var/log/chrony
maxupdateskew 100.0
rtcsync
makestep 1 3
allow 11.10.31/24
```

* Server X.X.X.X gibt die zu befragenden Server an
  * iburst beschleunigt die initiale Synchronisation
* allow X.X.X/XX  ist die Netzadresse auf der chrony als Server "lauschen" soll
  * wichtig ist hier die Subnetzmaske

##### Service neustarten
`sudo systemctl restart chrony.service`

##### rausfinden welche Server befragt werden(Übersicht)
```sudo chrony sources -v```

##### Siehe auch
* [Chrony FAQ](https://chrony.tuxfamily.org/faq.html)
