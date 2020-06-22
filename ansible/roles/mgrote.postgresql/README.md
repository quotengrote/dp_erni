## mgrote.postgresql

### Beschreibung
Installiert postgresql.
Legt eine Datenbank an und gibt einem Nutzer darauf die vollen ZUgriffsrechte.

### Funktioniert auf
- [x] Ubuntu (>=18.04)

### Variablen + Defaults
##### Name der Datenbank
name_db: 'miniflux_db'
##### Name des Datenbanknutzers
name_db_user: 'miniflux_db_user'
##### Passwort des Datenbanknutzers
password_db_user: 'geheim'

```
postgres_user_and_db:
  - { name_db: 'miniflux_db', name_db_user: 'miniflux_db_user', password_db_user: 'geheim' }
  - { name_db: 'telegraf_db', name_db_user: 'telegraf_db_user', password_db_user: 'geheim' }
```
