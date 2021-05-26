# VM bereistellen in PVE

## 1. auf PVE
1. anmelden PVE
2. Template-Ubu-Server klonen(Full-Clone)
3. Ubuntu installieren(Layout: DE, mit LVM; Nutzer=User:hallowelt)
3. Hostname nach Namenschema setzen
4. OpenSSH-Server installieren(mit Leertaste auswählen)
3. Install-ISO aus Hardware entfernen
4. nach Abschluss Installation Snapshot erstellen


## 2. auf ansible-vm
1. neuen branch im Repository erstellen
4. Hostname in ansible-inventory setzen(Funktionsgruppe und g_ubuntu/g_proxmox)
5. bei Bedarf: Group-Vars anpassen
6. `ansible-playbook playbooks/0_setup.yml -i inventory.yml --limit <hostname> --ask-vault-pass`
6. nach erfolgreichen Durchlauf; Snapshot erstellen
