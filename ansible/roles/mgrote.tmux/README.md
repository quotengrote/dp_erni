## mgrote.tmux
### Beschreibung
Installiert tmux und erstellt .tmux.conf.
Setzt tmux als "Standard-Shell".

### Funktioniert auf
- [x] Ubuntu (>=20.04)
- [x] ProxMox 6.1

### Variablen + Defaults
```yml
users_tmux:
  - username: <name des Users>
    tmux_allow: <true/false>
    tmux_downloadpath: "<link zu online tmux conf>"
    tmux_conf_destination: "/home/<name des Users>/.tmux.conf"
    tmux_bashrc_destination: "/home/<name des Users>/.bashrc"
    tmux_standardsession_name: "default"
```
