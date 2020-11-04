## mgrote.install_packages

### Beschreibung
Installiert tmux und erstellt .tmux.conf.
Setzt tmux als "Standard-Shell".

### Funktioniert auf
- [x] Ubuntu (>=18.04)
- [x] ProxMox 6.1

### Variablen + Defaults
##### Pfad zu .tmux.conf
  tmux_conf_destination: "/home/mg/.tmux.conf"
##### Pfad zu .bashrc
  tmux_bashrc_destination: "/home/mg/.bashrc"
##### Name für tmux-session
  tmux_standardsession_name: "default"
