## mgrote.install_packages

### Beschreibung
Fuehrt:
1. `apt update`
3. ` apt install {{ programme }}`
2. `apt upgrade`
aus.

### Funktioniert auf
- [x] Ubuntu (>=18.04)
- [x] Debian
- [ ] <del>CentOS</del>
- [x] ProxMox 6.1

### Variablen + Defaults
##### Programme
   - htop
   - nano
   - mc
   - curl
