# Readme

## Host und Gruppennamen
```yaml
  g_<gruppenname>:
    hosts:
      h_<hostname; später FQDN>:
        ansible_host: 11.10.31.223
```

## example-cli
`ansible-playbook playbooks/XXX.yml  -i inventory `

Vorbereitend ist noch eine Datei namens "__vault_password_file__" an zu legen welche das Klartextpasswort zur entschlüsselung der KeePass beinhaltet. 

## Aufnahme neuer Rechner in ansible
1. in Inventory ergänzen
    * mit Gruppe `<Betriebssystem>` - Cave: Wichtig für verschiedene Rollen + Updates!
    * mit Gruppe `<all>`
2. auf der Maschine muss der Nutzer `mg` mit dem Kennwort `hallowelt` vorhanden sein
    * Gruppe `sudo` + `ssh`
    * diesen Nutzer benötigt ansible um sich beim ersten mal auf diesen PC zu verbinden
3. Playbook bootstrap auf DIESEM Rechner ausführen
    * ansible-playbook playbooks/0_bootstrap.yml -i inventory.yml --limit=FQDN
4. danach alle weiteren notwendigen Playbooks ausführen
    * ansible-playbook playbooks/99_base.yml -i inventory.yml


## Rechte für ansible-user-private-key
`chmod 0400 ansible_private_key`

## ansible - vault + KeePass LookUp-Plugin


### Einrichtung
  * Das Plugin wird bei einer Installation mit dem Playbook "ansible" mit eingerichtet.
  * Die "Secrets" liegen in der KeepassDB die mit dem Kennwort aus `--ask-vault-pass` verschlüsselt ist.
  * Das vault-secret für die GroupVars wird mit `ansible-vault encrypt_string <password>` erstellt.

### Erklärung

```yaml
  keepass_dbx: "./keepass_db.kdbx"
  keepass_psw: !vault |
          $ANSIBLE_VAULT;1.1;AES256
          62383737XXXXXX531
```

1. mit `--ask-vault-pass` wird das Kennwort an ansible-vault übergeben
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
