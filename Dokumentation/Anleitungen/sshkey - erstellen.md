# sshkey erstellen

### SSH-Key erstellen unter Linux
#### auf Terminal erstellen und umwandeln mit Putty
* Terminal öffnen
* Eintragen:
	* `ssh-keygen -t rsa -b 4096`
* Ordner und Name angeben unter dem gespeichert werden soll
	* `./ssh/id_rsa`
* Passphrase anlegen oder nicht
* mit Putty umwandeln
	* Key auswählen, laden und speichern
* Key auf den Server kopieren

### SSH-Key erstellen unter Windows
#### auf Kommandozeile und umwandlung mit Putty
* CMD öffnen
* Eintrage:
	* `ssh-keygen -m PEM -t rsa -b 4096`
* Ordner und Name angeben unter dem gespeichert werden soll
	* `./ssh/id_rsa`
* Passphrase anlegen oder nicht
* mit Putty Key Generator öffnen:
	* Key auswählen, laden und speichern

#### direkt unter Putty erstellen

* Putty Key Generator öffnen
* auswahl der Parameter
* Generieren
* Passphrase anlegen oder nicht
* Speichern des Keys
