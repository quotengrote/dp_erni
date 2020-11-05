## mgrote.fileserver

### Beschreibung
Installiert und Konfiguriert einen Fileserver mit Samba.
#### Rechte
Rechte im Dateisystem sind
  - `chown -R root:users /shares/`
  - `chmod -R 777 /shares/`
  - alle Nutzer sind Mitglied der Gruppe "users"
  - in Samba(global)
    - `force user = root`
    - `force group = users`

Damit werden die Nutzer mit Ihrem Konto auf die SAMBA-Freigabe berechtigt, aber die Lese/Schreiboperationen auf dem Dateisystem als "root" durchgefuehrt.

### Funktioniert auf
- [x] Ubuntu (>=18.04)
- [ ] Debian


### Variablen
Es sind keine "defaults" gesetzt!
##### Anzulegende Nutzer mit Name, Gruppe, Passwort
  smb_nutzer:
    - { name: 'andreasgrote', groups: 'nutzer', password: 'hallowelt' }
##### um existierende Nutzer zu loeschen
  smb_nutzer_loeschen:
    - { name: '' }
##### zu erstellende Freigaben: mit Name, Ordnername, Basis-Ordner, Nutzer die lesen und schreiben duerfen
  smb_freigaben:
    - { freigabename: 'Backup', ordnername: 'Backup', base_folder: '/shares', lese_nutzer: '', schreibe_nutzer: 'annemariedroessler mg restic toolserver win10' }
##### Welche "Arbeitsgruppe"
  smb_workgroup: WORKGROUP
