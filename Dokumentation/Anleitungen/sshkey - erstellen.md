# sshkey erstellen und hashen

### SSH-Key erstellen unter Linux

* 'Terminal öffnen'

* 'Eintragen:
  
	* 'ssh-keygen -t rsa -b 4096'

* 'Ordner und Name angeben unter dem gespeichert werden soll'

	* './ssh/id_rsa'

* 'Passphrase anlegen oder nicht'

* 'Öffentlichen Key auf Server kopieren'


### SSH-Key erstellen unter Windows

#### auf Kommandozeile und umwandlung mit Putty

* 'CMD öffnen'

* 'Eintrage:

	* 'ssh-keygen -m PEM -t rsa -b 4096'

* 'Ordner und Name angeben unter dem gespeichert werden soll'

	* './ssh/id_rsa'

* 'Passphrase anlegen oder nicht'

* 'mit Putty Key Generator öffnen:

	* 'key auswählen und laden und speichern"

* 'Key mit WinSCP auf den Server kopieren'

#### direkt unter Putty erstellen

* 'Putty Key Generator öffnen'

* 'auswahl der Parameter'

* 'Generate'

* 'Passphrase anlegen oder nicht'

* 'Speichern des Keys'

* 'Key mit WinSCP auf den Server kopieren'
