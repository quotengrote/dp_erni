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
