## mgrote.apt_manage_sources

### Beschreibung
  * Ubuntu: Setzt einen apt-proxy
  * Proxmox:
    * entfernt das Enterprise Repository
    * setzt das "no-subscription"-Repository
    * Setzt einen apt-proxy

  - [x] Ubuntu (>=18.04)
  - [x] Ubuntu (>=20.04)
  - [x] ProxMox (>=6.1)

### Variablen + Defaults
##### Ubuntu/Proxmox: FQDN Proxy, wenn leer wird kein Proxy gesetzt
```yaml
manage_sources_apt_proxy_url: "" # leer = kein proxy, sonst "acng.grote.lan:9999"
```

##### Proxmox: Pfad lokal zum Enterprise-Repository
```yaml
  manage_sources_enterprise_repo_path: /etc/apt/sources.list.d/pve-enterprise.list # wo ist das enterprise-repo

```

##### Proxmox: Releases-Key URL für no-subscrition-Repository
```yaml
manage_sources_apt_repo_key_url: http://download.proxmox.com/debian/proxmox-ve-release-6.x.gpg # url zum key für no-subscription-repo
```

##### Proxmox: Releases-Key Pfad lokal für no-subscrition-Repository
```yaml
manage_sources_apt_repo_key_path: /etc/apt/trusted.gpg.d/proxmox-ve-release-6.x.gpg # pfad lokal zum key für no-subscription-repo
```

##### Proxmox: URL no-subscrition-Repository
```yaml
manage_sources_apt_repo_no_subscription: deb http://{{ manage_sources_apt_proxy_url }}/download.proxmox.com/debian/pve buster pve-no-subscription # url zum für no-subscription-repo, manage_sources_apt_proxy_url wird aus der variable entnommen
```

##### Proxmox: Basis-Repositories URLs
```yaml
manage_sources_proxmox_base_repos: # welche debian standard repos sollen gesetzt werden, werden vorher gelöscht damit ein proxy dann gesetzt werden kann
  - repo_url: deb http://ftp.de.debian.org/debian buster main contrib
  - repo_url: deb http://ftp.de.debian.org/debian buster-updates main contrib
  - repo_url: deb http://security.debian.org buster/updates main contrib```
```

##### Proxmox: Pfad lokal für Basis-Repositories
```yaml
manage_sources_debian_repo_path: /etc/apt/sources.list.d/debian # , wo sollen die standard-repos gespeichert werden; nicht auf /etc/apt/sources setzen, diese datei wird gelöscht```
