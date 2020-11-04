# Ansible - Einführung in den Betrieb des Azubisracks MD


1. ansible Host händisch bereitstellen
    ```
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
    python get-pip.py --user
    python -m pip install --user ansible
    python -m pip install --user pykeepass
    ```
1. git Repository klonen(als ansible-user)
    ```
    git clone https://github.com/quotengrote/dp_ausb_md
    ```
2. `ansible-galaxy collection install community.general`
1. IPs in Inventory setzen
1. Nutzer für Erstanmeldung setzen
1. lokalen ssh-key für ansible-user generieren(ohne Passwort)
2. nach RollOut IPs entfernen und Host per Hostnamen ansprechen
1. Nur ansible Playbook ausrollen(nicht 0_base, die restlichen Dienste stehen noch nicht bereit)


set_apt_sources einkommentieren nach acng
lookups prüfen
vars files prüfen
vault pw anpassen
ssh keys generieren und in keepass packen
nutzer pw in keepass packen
