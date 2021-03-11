# Readme

## Aufnahme neuer Rechner in ansible
1. in Inventory ergänzen
1.1 mit Gruppe `<Betriebssystem>` - Cave: Wichtig für verschiedene Rollen + Updates!
1.2 mit Gruppe `<all>`
2. auf der Maschine muss der Nutzer `mg` mit dem Kennwort `hallowelt` vorhanden sein
2.1 Gruppe `sudo` + `ssh`
2.1 diesen Nutzer benötigt ansible um sich beim ersten mal auf diesen PC zu verbinden
3. Playbook bootstrap auf DIESEM Rechner ausführen
3.1 ansible-playbook playbooks/0_bootstrap.yml -i inventory.yml --limit=FQDN
4. danach alle weiteren notwendigen Playbooks ausführen
4.1 ansible-playbook playbooks/99_base.yml -i inventory.yml


## Rechte für ansible-user-private-key
`chmod 0400`

## ansible - vault + KeePass LookUp-Plugin


### Einrichtung
  * Das Plugin wird bei einer Installation mit dem Playbook "ansible" mit eingerichtet.
  * Die "Secrets" liegen in der KeepassDB die mit dem Kennwort aus `vault-pass.yml` verschlüsselt ist.
  * `vault-pass.yml` steht mit in der .gitignore
  * Die Variable `vault_password_file` ist mit `~/ansible/vault-pass.yml` in der `ansible.cfg` gesetzt.
  * Diese Datei enthält das Passwort mit dem die KeePassDB verschlüsselt ist.
  * Das vault-secret für die GroupVars wird mit `ansible-vault encrypt_string <password>` erstellt.

### Erklärung

```yaml
  keepass_dbx: "./keepass_db.kdbx"
  keepass_psw: !vault |
          $ANSIBLE_VAULT;1.1;AES256
          62383737XXXXXX531
```

1. mit `vault-pass.yml` wird das Kennwort an ansible-vault übergeben
2. ansible-vault entschlüsselt hiermit die Variable `keepass_psw`
3. der Inhalt der Variable wird dann an das KeePass-Lookup-Plugin übergeben was damit die KeePass-Datei öffnet

### Abfrage der Secrets in tasks/playbooks
`restic_repository_password: "{{ lookup('keepass', 'restic_repository_password', 'password') }}"`

#### Erklärung

```yaml
restic_repository_password:         <-- Ansible Variablen Name
lookup('keepass'                    <-- Aufruf Keepass-Lookup-Plugin
restic_repository_password          <-- Titel Eintrag mit Secret
password                            <-- Feldbzeichner in KeepassDB
```
