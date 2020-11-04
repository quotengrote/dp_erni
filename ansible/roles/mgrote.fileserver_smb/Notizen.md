  path = /media/share
  writeable = yes
  browseable = yes
  public = yes
  create mask = 0644
  directory mask = 0755
  force user = shareuser
  fuer alle













  - name: Erstelle SAMBA-Shares
    template:
      src: smb.conf
      dest: /etc/samba/smb.conf
      validate: 'testparm -s %s'
    notify: smbd neustarten



  - name: Testing Iteration
    copy:
      dest: /etc/samba/smb.conf
      content: |
        {% for freigaben in [freigaben] %}
        [{{ item.freigabename }}]
        read only = no
        browseable = yes
        public = yes
        writable = yes
        available = yes
        valid users {{ item.erlaubte_user }}
        path = /shares/{{ item.ordnername }}

        {% endfor %}



(% for freigaben in {{ freigaben }} %)

{{ item.freigabename }}
read only = no

(% endfor %)


  valid users {{ item.erlaubte_user }}


[mg]
        path = /srv/7050c4a3-98ad-41bd-804d-a85c94b16468/mg
        hide special files = Yes
        create mask = 0664
        directory mask = 0775
        force create mode = 0664
        force directory mode = 0775
        inherit acls = Yes
        read only = No
        valid users = michaelgrote win10
        write list = michaelgrote win10
        vfs objects = recycle
        recycle:maxsize = 0
        recycle:exclude_dir =
        recycle:exclude =
        recycle:subdir_mode = 0700
        recycle:directory_mode = 0777
        recycle:touch = yes
        recycle:versions = yes
        recycle:keeptree = yes
        recycle:repository = .recycle/%U



[aptcacherng]
        path = /srv/7050c4a3-98ad-41bd-804d-a85c94b16468/aptcacherng
        hide special files = Yes
        create mask = 0664
        directory mask = 0775
        force create mode = 0664
        force directory mode = 0775
        inherit permissions = Yes
        read only = No




[Backup]
        path = /srv/7050c4a3-98ad-41bd-804d-a85c94b16468/Backup
        hide special files = Yes
        create mask = 0664
        directory mask = 0775
        force create mode = 0664
        force directory mode = 0775
        inherit acls = Yes
        read only = No
        valid users = annemariedroessler michaelgrote restic toolserver win10
        write list = annemariedroessler michaelgrote restic toolserver win10
        vfs objects = recycle
        recycle:maxsize = 0
        recycle:exclude_dir =
        recycle:exclude =
        recycle:subdir_mode = 0700
        recycle:directory_mode = 0777
        recycle:touch = yes
        recycle:versions = yes
        recycle:keeptree = yes
        recycle:repository = .recycle/%U


[amd]
        path = /srv/7050c4a3-98ad-41bd-804d-a85c94b16468/amd
        hide special files = Yes
        create mask = 0664
        directory mask = 0775
        force create mode = 0664
        force directory mode = 0775
        inherit acls = Yes
        read list = michaelgrote win10
        read only = No
        valid users = michaelgrote annemariedroessler win10
        write list = annemariedroessler
        vfs objects = recycle
        recycle:maxsize = 0
        recycle:exclude_dir =
        recycle:exclude =
        recycle:subdir_mode = 0700
        recycle:directory_mode = 0777
        recycle:touch = yes
        recycle:versions = yes
        recycle:keeptree = yes
        recycle:repository = .recycle/%U










        server string = %h server
        log file = /var/log/samba/log.%m
        logging = syslog
        max log size = 1000
        panic action = /usr/share/samba/panic-action %d
        disable spoolss = Yes
        load printers = No
        printcap name = /dev/null
        map to guest = Bad User
        pam password change = Yes
        passwd chat = *Enter\snew\s*\spassword:* %n\n *Retype\snew\s*\spassword:* %n\n *password\supdated\ssuccessfully* .
        passwd program = /usr/bin/passwd %u
        socket options = TCP_NODELAY IPTOS_LOWDELAY
        dns proxy = No
        idmap config * : backend = tdb
        printing = bsd
        acl allow execute always = Yes
        create mask = 0777
        directory mask = 0777
        aio read size = 16384
        aio write size = 16384
        allocation roundup size = 4096
        use sendfile = Yes




Variable precedence
docs

From 2.0 on, from lowest priority to highest - in other words, if a variable is defined in two places, the place that’s farther down in this list takes precedence.

role defaults [1]
inventory file or script group vars [2]
inventory group_vars/all [3]
playbook group_vars/all [3]
inventory group_vars/* [3]
playbook group_vars/* [3]
inventory file or script host vars [2]
inventory host_vars/*
playbook host_vars/*
host facts / cached set_facts [4]
inventory host_vars/* [3]
playbook host_vars/* [3]
host facts
play vars
play vars_prompt
play vars_files
role vars (defined in role/vars/main.yml)
block vars (only for tasks in block)
task vars (only for the task)
include_vars
set_facts / registered vars
role (and include_role) params
include params
extra vars (defined on command line with -e, always win precedence)
