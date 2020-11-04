# Ansible Vault + KeePass LookUp-Plugin

# Einrichtung
Das Plugin wird bei einer Installation mit dem Playbook "ansible" mit eingerichtet.

Die "Secrets" liegen in der KeepassDB die mit dem Kennwort aus "vault-pass.yml" verschlüsselt ist.
"vault-pass.yml" steht mit in der .gitignore
Die Variable "vault_password_file" ist mit " ~/ansible/vault-pass.yml" in der ansible.cfg gesetzt.

# Abfrage der Secrets in tasks/playbooks
`restic_repository_password: "{{ lookup('keepass', 'restic_repository_password', 'password') }}"`

## Erklärung
```
restic_repository_password:         <-- Ansible Variablen Name
lookup('keepass'                    <-- Aufruf Keepass-Lookup-Plugin
restic_repository_password          <-- Titel Eintrag mit Secret
password                            <-- Feldbzeichner in KeepassDB
```
