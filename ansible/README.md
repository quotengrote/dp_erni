# Readme

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
`chmod 0400`
