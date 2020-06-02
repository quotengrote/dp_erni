#### Cluster erstellen
##### Vo­r­aus­set­zung
1. DNS-Namensauflösung muss intern funktionieren
2. NTP-Server muss im internen Netz funktionieren
  1. [NTP-Server muss in pve eingerichtet sein](#pve als NTP-Client einrichten)

  | :warning: WARNING          |
|:---------------------------|
| Link Kaputt, oben drüber!      |
3. Für ein HA Cluster müssen es mindestens 3 Server sein  
4. Empfohlen: 2. NIC nur für Clusterverkehr(corosync)
   Cave: Changing the hostname and IP is not possible after cluster creation.

* Falls schon VMs existieren, sollte der Server auf dem dieses laufen, der Server sein von dem aus der Cluster erstellt wird, da auf den joinenden Clustern die Daten gelöscht werden.

Ablauf
2. NIC konfigurieren
3. alle IPs müssen im DNS stehen

##### Erstellen
`pvecm create CLUSTERNAME -link0 <ip>`
* Link0 ist die NIC über die der Corosyncverkehr laufen soll

When adding a node to a cluster with a separated cluster network you need to use the link0 parameter to set the nodes address on that network:

`pvecm add IP-ADDRESS-CLUSTER -link0 <ip>`


Status: `pvecm status`

##### Siehe auch
* [PVE Wiki](https://pve.proxmox.com/wiki/Cluster_Manager)
