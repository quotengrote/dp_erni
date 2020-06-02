### Apt-Cacher-NG
* Url für WebGui: http://rmvmlacng0.azubi.erni:9999/acng-report.html
#### Installation
1. `sudo apt install apt-cacher-ng`
6. `sudo nano /etc/apt-cacher-ng/acng.conf`
    > CacheDir: /mnt/apt_omv
    > Port:9999
    > ExThreshold: 60
    > PidFile: /var/run/apt-cacher-ng/pid
    > Proxy: http://11.8.108.254:8080
7. `sudo systemctl enable apt-cacher-ng`
    * systemd-Dienst aktivieren
7. `sudo systemctl start apt-cacher-ng`
8. `sudo systemctl status apt-cacher-ng`
9. `sudo init 6`


#### Clients
##### Beispiel sources.list - Ubuntu 19.04
`sudo nano /etc/apt/sources.list`
proxy pro Repo ergänzen
> deb http://de.archive.ubuntu.com/ubuntu/ eoan main restricted --> deb http://apt-cacher-ng.grote.local:9999/de.archive.ubuntu.com/ubuntu/ eoan main restricted
```
deb http://apt-cacher-ng.grote.local:9999/de.archive.ubuntu.com/ubuntu/ eoan main restricted
deb http://apt-cacher-ng.grote.local:9999/de.archive.ubuntu.com/ubuntu/ eoan-updates main restricted
deb http://apt-cacher-ng.grote.local:9999/de.archive.ubuntu.com/ubuntu/ eoan universe
deb http://apt-cacher-ng.grote.local:9999/de.archive.ubuntu.com/ubuntu/ eoan-updates universe
deb http://apt-cacher-ng.grote.local:9999/de.archive.ubuntu.com/ubuntu/ eoan multiverse
deb http://apt-cacher-ng.grote.local:9999/de.archive.ubuntu.com/ubuntu/ eoan-updates multiverse
deb http://apt-cacher-ng.grote.local:9999/de.archive.ubuntu.com/ubuntu/ eoan-backports main restricted universe multiverse
deb http://apt-cacher-ng.grote.local:9999/security.ubuntu.com/ubuntu eoan-security main restricted
deb http://apt-cacher-ng.grote.local:9999/security.ubuntu.com/ubuntu eoan-security universe
deb http://apt-cacher-ng.grote.local:9999/security.ubuntu.com/ubuntu eoan-security multiverse
```

#### Siehe auch
* https://geekflare.com/create-apt-proxy-on-raspberrypi/
* https://daniel-ziegler.com/linux/computer/2017/09/01/Apt-Cacher-ng-ubuntu/
* https://github.com/Efreak/apt-cacher-ng
