#!/bin/bash
{{ file_header | default () }}
#####################
## https://www.tothenew.com/blog/foolproof-your-bash-script-some-best-practices/
set -o nounset
set -o errexit
# trap ctrl-c and call ctrl_c()
trap ctrl_c INT

function ctrl_c() {
  echo "** Trapped CTRL-C"
}

for i in `seq 1 5`; do
  sleep 1
  echo -n "."
done
#####################
# https://forum.rclone.org/t/bash-script-cronjob-for-automating-rclone-sync/13526/2
LOCKDIR=${HOME}/.cache
# Get an exclusive lock or exit
function exlock() {
    exec {lock_fd}>${LOCKDIR}/$(basename $0).lock
    flock -nx "$lock_fd"
    if [[ $? == 1 ]]; then
        exit 1
    fi
}
# Cleanup lock file and exit
function unlock() {
    rm "${LOCKDIR}/$(basename $0).lock"
    [[ -n $1 ]] && exit $1
    exit
}
#####################
# Damit prueft ob das Script ob es schon laeuft
exlock
#####################
HIER BEFEHLE EINSETZEN!

echo x   | ts '%Y-%m-%d - %H-%M-%S'
#####################
#Hiermit wird die Lockdatei geloescht
unlock
