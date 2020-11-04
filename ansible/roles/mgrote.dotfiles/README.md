## mgrote.dotfiles

### Beschreibung
Klont ein git-repo, und symlinked die darin enthaltenen Dateien in ein Verzeichnis.

### Funktioniert auf
- [ ] Ubuntu (>=18.04)
- [ ] ProxMox 6.1

### Variablen + Defaults
##### Remote Repository
  dotfiles_remote_repo: "https://github.com/quotengrote/dotfiles"
##### User
  dotfiles_user: "mg"
##### Where to Link
  dotfiles_link_target: "/home/mg"
##### Local Repo
  dotfiles_local_repo_directory: "/home/mg/dotfiles-repo"
##### Which files should be linked
  dotfiles_files_to_copy:
    - .tmux.conf
    - .bash_aliases
