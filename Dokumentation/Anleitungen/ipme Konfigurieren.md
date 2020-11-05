# Anleitung IPMI konfigurieren
#### Bios anpassen
- mit F2 ins BIOS Booten
- server mgnt
  - iRMC lan parameter configuration ->IP Konfiguration anpassen


#### IPMI video redirection konfigurieren
1. IPMI in WebGui öffnen [ip in Doku](/Dokumentation/Übersicht.md)
1. Console Redirection -> Video Redirection -> start Video Redirection
1. Java Datei speichern (runterladen), öffnen und ausführen (Warnung ignorieren)

1. Bei folgenden Fehlermeldungen:
   ![Anwendungsfehler](/Bilder/ipme/Anwendungsfehler.png)

    in Pfad:  _C:\Program Files (x86)\Java\jre<aktuellste_Versionsnummer>\lib\security_ __oder__ _C:\Program Files\Java\jre<aktuellste_Versionsnummer>\lib\security_
    Die Datei: ___java.security___ mit Admin Rechten bearbeiten.
    `jdk.jar.disabledAlgorithms=MD2, MD5, RSA keySize < 1024`
    ändern zu `jdk.jar.disabledAlgorithms=MD2 keySize < 1024`
(https://blog.wydler.eu/2017/11/04/fujitsu-irmc-s3-unter-java-jre-weiter-nutzen/)

    ![Java-Anwendung blockiert](/Bilder/ipme/Java-Anwendung-blockiert.png)
(https://www.java.com/de/download/help/exception_sitelist.html)
  Ausnahme hinzufügen:
    Java -> Sicherheit -Siteliste bearbeiten -> hinzufügen:
    Anleitung:
    URL hinzufügen _Warnmeldung ignorieren_ -> Fortfahren ->

    Sicherheitswarnung akzeptieren und ausführen
