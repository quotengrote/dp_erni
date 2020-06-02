### Hostname ändern

https://pve.proxmox.com/wiki/Renaming_a_PVE_node

Rename a standalone PVE host, you **need** to edit:

* /etc/hosts

* /etc/hostname

In the above files replace all occurrences of the *old name* with the **new one**. Ensure that /etc/hosts has an entry with the hostname mapped to the IP you want to use as main IP address for this node.

There are other files which you may want to edit, they are not important for the functions of Proxmox VE itself.

* /etc/mailname

* /etc/postfix/main.cf

If your node is in a cluster, where it is not recommended to change its name, adapt /etc/pve/corosync.conf so that the nodes name is changed also there. See <https://pve.proxmox.com/pve-docs/chapter-pvecm.html#edit-corosync-conf>
