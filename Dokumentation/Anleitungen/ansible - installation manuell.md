# Ansible ohne Ansible bereitstellen

Dargestellt auf Ubuntu 20.04.

1. Beliebige VM aufsetzen die Zugriff auf das Internet ohne Proxy hat
2. `apt install python3 python3-pip sshpass -y`
3. `pip3 install pykeepass==3.2.1 --user`
4. `git clone https://github.com/quotengrote/dp_ausb_md/`
5. `cd dp_ausb_md/ansible/`
6. ansible_private_key in ansible Ordner kopieren
7. `chmod 0400 ansible_private_key`
8. `ansible-playbook playbook/base/1_bootstrap.yml playbook/base/99_base.yml playbook/app/install_ansible.yml -i inventory --limit *<Hostname>* --ask-vault-pass`
8. Have fun.
