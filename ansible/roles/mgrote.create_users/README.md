## mgrote.create_users

### Beschreibung
erstellt Nutzer.
### getestet auf
- [x] Ubuntu (>=18.04)
- [x] Debian

### Variablen + Defaults
##### Nutzer anlegen
base_users:
    - { name: 'mg', password: 'hallowelt', groups: 'sudo, ssh'}
