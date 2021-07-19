#!/bin/bash
# shellcheck disable=SC1054
# shellcheck disable=SC1009
# shellcheck disable=SC1073
# shellcheck disable=SC1064
# shellcheck disable=SC1072
{{ file_header | default () }}
LOCKDIR=${HOME}/.cache
function exlock() {
    exec {lock_fd}>${LOCKDIR}/$(basename $0).lock
    flock -nx "$lock_fd"
    if [[ $? == 1 ]]; then
        exit 1
    fi
}
function unlock() {
    rm "${LOCKDIR}/$(basename $0).lock"
    [[ -n $1 ]] && exit $1
    exit
}

exlock
(

/usr/local/bin/cv4pve/cv4pve-autosnap --host=127.0.0.1 --api-token {{ cv4pve_api_user }}={{ cv4pve_api_token }} --vmid="{{ cv4pve_vmid }}" snap --label='daily' --keep="{{ cv4pve_keep_snapshots }}" --state  | ts '%Y-%m-%d - %H-%M-%S'
/usr/local/bin/cv4pve/cv4pve-autosnap --host=127.0.0.1 --api-token {{ cv4pve_api_user }}={{ cv4pve_api_token }} --vmid="all" status  | ts '%Y-%m-%d - %H-%M-%S'
) >> /var/log/cv4pve-autosnap.log 2>&1

unlock
