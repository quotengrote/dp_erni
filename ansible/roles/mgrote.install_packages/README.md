## mgrote.install_packages

### Beschreibung
Fuehrt:
1. `apt update`
3. ` apt install {{ programme }}`
2. `apt upgrade`
aus.

Es wird unterschieden ob das Ziel eine VM ist oder nicht.

### Funktioniert auf
- [x] Ubuntu (>=18.04)
- [x] Debian
- [x] ProxMox 6.1

### Variablen + Defaults
- siehe default/main.yml
