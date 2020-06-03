# Nutzer für ProxMox WebGui erstellen

1. Gruppe erstellen
    - `pveum groupadd <group_name> -comment "<Kommentar>"`

2. Nutzer erstellen und zu Gruppe hinzufügen
    - `pveum useradd <user_name>@pve -group <group_name> -password <password>`

3. Rolle erstellen
    - `pveum roleadd <role_name> -privs "<Rechte>"`

4. Gruppenrechte setzen
    - `pveum aclmod / -group <group_name> -role <role_name>`




Für eine Übersicht der einzelnen Nutzer, Gruppen und Zuweisungen, auschließlich Passwörter `nano /etc/pve/user.cfg` aufrufen.

Passwörter sind in der beigefügten __KeePass__ Datei angegeben

###### Siehe auch
* [PVE-Wiki](https://pve.proxmox.com/wiki/User_Management#_command_line_tool)

#### Beispiel:

1. Gruppe erstellen
    - Wir erstellen eine Gruppe mit dem Namen ___g_Standardnutzer___ und einem Sprechenden Komentar.
    `pveum groupadd g_Standardnutzer -comment "Gruppenkommentar"`

2. Nutzer erstellen und zu Gruppe hinzufügen
    - Es wird ein Benutzer mit dem Namen ___User01___ auf dem PVE erstellt und direkt der Gruppe ___g_Standardnutzer___ zugewiesen. Mit `-password` weißen wir dem Benutzer ___User01___ das Passwort ___hallowelt___
    `pveum useradd User01@pve -group g_Standardnutzer -password hallowelt`

3. Rolle erstellen
    - Als nächstes wird eine Rolle mit dem Namen ___r_Standardnutzer___ und den Privilegien ___VM.Config.CDROM, VM.PowerMgmt, VM.Console, VM.Audit, VM.Backup___
    `pveum roleadd r_Standardnutzer -privs "VM.Config.CDROM, VM.PowerMgmt, VM.Console, VM.Audit, VM.Backup"`

 4. Gruppenrechte setzen
    - Zuletzt weißen wir der Gruppe ___g_Standardnutzer___ ihre Rolle ___r_Standardnutzer___ zu
    `pveum aclmod / -group g_Standardnutzer -role r_Standardnutzer`

------------------------------

##### Pool in Shell erstellen
Mit:
-  `pool:<pool_name>:<Kommentar>:VM_ID:<storage_name>:`

als Ausdruck in der `/etc/pve/user.cfg` lässt sich ein neuer pool in der Shell erstellen.

Hierbei werden die Members (Mitglieder), welche Virtuelle Maschienen und oder Storage sind hinzugefügt und durch Kommas getrennt. Es ist wichtig das jeder Pool einen Storage zugeordnet bekommt auf dem VMs abgelegt werden können.

##### Berechtigungen auf Pools und VMs setzen
Die Permissions (Rechte) und somit die Benutzer und Benutzergruppen werden durch:
- `acl:1:/pool/<pool_name>:<user_name>@pve,@<group_name>:<role_name>:`
in der `/etc/pve/user.cfg` hinzugefügt

oder mit dem Befehl:
- `pveum aclmod <path> -group <group_name> -roles <role_name> [OPTIONS]`
über die Komandozeile

___path___ steht hierbei für den Pfad der Rechte eines Nutzers oder einer Gruppe.

Einige Beispiele sind:

`/node/<node>` : Zugriff auf Proxmox VE-Servercomputer

`/vms` : Deckt alle VMs ab

`/vms/<VM_ID>` : Zugriff auf bestimmte VMs

`/storage/<Storage_ID>` : Zugriff auf Speicher

`/pool/<pool_name>` : Zugriff auf VMs als Teil eines Pools

`/access/groups` : Gruppenverwaltung

`/access/realms/<Realm_ID>` : Administrativer Zugriff auf Realms

Genauer nach zu lesen unter [Objekte und Pfade](https://pve.proxmox.com/pve-docs/chapter-pveum.html#_objects_and_paths)
