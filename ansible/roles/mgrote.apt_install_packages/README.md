## mgrote.apt_install_packages

### Beschreibung
Fuehrt:
`apt install {{ programme }}`
aus.
```yaml
  programs_common:
    - locales
    - wird überall installiert
  programs_only_physical:
    - hddtemp
    - nur auf Hardware-Maschinen
  programs_only_vms:
    - qemu-guest-agent
    - nur in VMs
  programs_extra:
    - Extra-Parameter für einzelne Hosts
```
Es wird unterschieden ob das Ziel eine VM ist oder nicht.

### Funktioniert auf
- [x] Ubuntu (>=18.04)
- [x] Debian
- [x] ProxMox 6.1

### Variablen + Defaults
- siehe default/main.yml
