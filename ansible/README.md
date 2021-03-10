# Readme

## Aufnahme neuer Rechner in ansible
1. in Inventory ergänzen
1.1 mit Gruppe `<Betriebssystem>` - Cave: Wichtig für verschiedene Rollen + Updates!
1.2 mit Gruppe `<all>`
2. auf der Maschine muss der Nutzer `mg` mit dem Kennwort `hallowelt` vorhanden sein
2.1 diesen Nutzer benötigt ansible um sich beim ersten mal auf diesen PC zu verbinden
3. Playbook bootstrap auf DIESEM Rechner ausführen
4. danach alle weiteren notwendigen Playbooks ausführen
