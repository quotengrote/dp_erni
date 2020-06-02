# resize ext4

root@RMVMLNC0:/dev/mapper# cat /etc/fstab
# /etc/fstab: static file system information.
#
# Use 'blkid' to print the universally unique identifier for a
# device; this may be used with UUID= as a more robust way to name devices
# that works even if disks are added and removed. See fstab(5).
#
# <file system> <mount point>   <type>  <options>       <dump>  <pass>
# / was on /dev/sda1 during installation
UUID=297d1c30-31bc-42e2-b1ce-fbf5583b5853 /               ext4    errors=remount-ro 0       1
/swapfile                                 none            swap    sw              0       0
root@RMVMLNC0:/dev/mapper# lvdisplay
root@RMVMLNC0:/dev/mapper# apt install e2fsprogs
Paketlisten werden gelesen... Fertig
Abhängigkeitsbaum wird aufgebaut.
Statusinformationen werden eingelesen.... Fertig
e2fsprogs ist schon die neueste Version (1.44.1-1ubuntu1.3).
Die folgenden Pakete wurden automatisch installiert und werden nicht mehr benötigt:
  libllvm8 linux-headers-4.15.0-55 linux-headers-4.15.0-55-generic linux-image-4.15.0-55-generic
  linux-modules-4.15.0-55-generic linux-modules-extra-4.15.0-55-generic
Verwenden Sie »apt autoremove«, um sie zu entfernen.
0 aktualisiert, 0 neu installiert, 0 zu entfernen und 1 nicht aktualisiert.
root@RMVMLNC0:/dev/mapper# resize2fs -p /dev/sda1
resize2fs 1.44.1 (24-Mar-2018)
The filesystem is already 8388096 (4k) blocks long.  Nothing to do!

root@RMVMLNC0:/dev/mapper# cfdisk

root@RMVMLNC0:/dev/mapper# cfdisk

Syncing disks.
root@RMVMLNC0:/dev/mapper# resize2fs -p /dev/sda1
resize2fs 1.44.1 (24-Mar-2018)
The filesystem is already 8388096 (4k) blocks long.  Nothing to do!

root@RMVMLNC0:/dev/mapper# resize2fs -p /dev/sda
resize2fs 1.44.1 (24-Mar-2018)
resize2fs: Device or resource busy while trying to open /dev/sda
Couldn't find valid filesystem superblock.
root@RMVMLNC0:/dev/mapper# resize2fs -p /dev/sd^C
root@RMVMLNC0:/dev/mapper# ^C
root@RMVMLNC0:/dev/mapper# lsblk
NAME   MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sda      8:0    0  132G  0 disk
└─sda1   8:1    0   32G  0 part /
sr0     11:0    1 1024M  0 rom
root@RMVMLNC0:/dev/mapper# resize2fs -p /dev/sda1
resize2fs 1.44.1 (24-Mar-2018)
The filesystem is already 8388096 (4k) blocks long.  Nothing to do!

root@RMVMLNC0:/dev/mapper# parted
GNU Parted 3.2
Using /dev/sda
Welcome to GNU Parted! Type 'help' to view a list of commands.
(parted) help
  align-check TYPE N                        check partition N for TYPE(min|opt) alignment
  help [COMMAND]                           print general help, or help on COMMAND
  mklabel,mktable LABEL-TYPE               create a new disklabel (partition table)
  mkpart PART-TYPE [FS-TYPE] START END     make a partition
  name NUMBER NAME                         name partition NUMBER as NAME
  print [devices|free|list,all|NUMBER]     display the partition table, available devices, free
        space, all found partitions, or a particular partition
  quit                                     exit program
  rescue START END                         rescue a lost partition near START and END
  resizepart NUMBER END                    resize partition NUMBER
  rm NUMBER                                delete partition NUMBER
  select DEVICE                            choose the device to edit
  disk_set FLAG STATE                      change the FLAG on selected device
  disk_toggle [FLAG]                       toggle the state of FLAG on selected device
  set NUMBER FLAG STATE                    change the FLAG on partition NUMBER
  toggle [NUMBER [FLAG]]                   toggle the state of FLAG on partition NUMBER
  unit UNIT                                set the default unit to UNIT
  version                                  display the version number and copyright information of
        GNU Parted
(parted) print sda
Model: QEMU QEMU HARDDISK (scsi)
Disk /dev/sda: 142GB
Sector size (logical/physical): 512B/512B
Partition Table: msdos
Disk Flags:

Number  Start   End     Size    Type     File system  Flags
 1      1049kB  34,4GB  34,4GB  primary  ext4         boot

  align-check TYPE N                        check partition N for TYPE(min|opt) alignment
  help [COMMAND]                           print general help, or help on COMMAND
  mklabel,mktable LABEL-TYPE               create a new disklabel (partition table)
  mkpart PART-TYPE [FS-TYPE] START END     make a partition
  name NUMBER NAME                         name partition NUMBER as NAME
  print [devices|free|list,all|NUMBER]     display the partition table, available devices, free
        space, all found partitions, or a particular partition
  quit                                     exit program
  rescue START END                         rescue a lost partition near START and END
  resizepart NUMBER END                    resize partition NUMBER
  rm NUMBER                                delete partition NUMBER
  select DEVICE                            choose the device to edit
  disk_set FLAG STATE                      change the FLAG on selected device
  disk_toggle [FLAG]                       toggle the state of FLAG on selected device
  set NUMBER FLAG STATE                    change the FLAG on partition NUMBER
  toggle [NUMBER [FLAG]]                   toggle the state of FLAG on partition NUMBER
  unit UNIT                                set the default unit to UNIT
  version                                  display the version number and copyright information of
        GNU Parted
(parted) select /dev/sda
Using /dev/sda
(parted) ls
  align-check TYPE N                        check partition N for TYPE(min|opt) alignment
  help [COMMAND]                           print general help, or help on COMMAND
  mklabel,mktable LABEL-TYPE               create a new disklabel (partition table)
  mkpart PART-TYPE [FS-TYPE] START END     make a partition
  name NUMBER NAME                         name partition NUMBER as NAME
  print [devices|free|list,all|NUMBER]     display the partition table, available devices, free
        space, all found partitions, or a particular partition
  quit                                     exit program
  rescue START END                         rescue a lost partition near START and END
  resizepart NUMBER END                    resize partition NUMBER
  rm NUMBER                                delete partition NUMBER
  select DEVICE                            choose the device to edit
  disk_set FLAG STATE                      change the FLAG on selected device
  disk_toggle [FLAG]                       toggle the state of FLAG on selected device
  set NUMBER FLAG STATE                    change the FLAG on partition NUMBER
  toggle [NUMBER [FLAG]]                   toggle the state of FLAG on partition NUMBER
  unit UNIT                                set the default unit to UNIT
  version                                  display the version number and copyright information of
        GNU Parted
(parted) resizepart 1
Warning: Partition /dev/sda1 is being used. Are you sure you want to continue?
Yes/No? yes
End?  [34,4GB]? 134GB
(parted) print /dev/sda
Model: QEMU QEMU HARDDISK (scsi)
Disk /dev/sda: 142GB
Sector size (logical/physical): 512B/512B
Partition Table: msdos
Disk Flags:

Number  Start   End    Size   Type     File system  Flags
 1      1049kB  134GB  134GB  primary  ext4         boot

  align-check TYPE N                        check partition N for TYPE(min|opt) alignment
  help [COMMAND]                           print general help, or help on COMMAND
  mklabel,mktable LABEL-TYPE               create a new disklabel (partition table)
  mkpart PART-TYPE [FS-TYPE] START END     make a partition
  name NUMBER NAME                         name partition NUMBER as NAME
  print [devices|free|list,all|NUMBER]     display the partition table, available devices, free
        space, all found partitions, or a particular partition
  quit                                     exit program
  rescue START END                         rescue a lost partition near START and END
  resizepart NUMBER END                    resize partition NUMBER
  rm NUMBER                                delete partition NUMBER
  select DEVICE                            choose the device to edit
  disk_set FLAG STATE                      change the FLAG on selected device
  disk_toggle [FLAG]                       toggle the state of FLAG on selected device
  set NUMBER FLAG STATE                    change the FLAG on partition NUMBER
  toggle [NUMBER [FLAG]]                   toggle the state of FLAG on partition NUMBER
  unit UNIT                                set the default unit to UNIT
  version                                  display the version number and copyright information of
        GNU Parted
(parted) exit
  align-check TYPE N                        check partition N for TYPE(min|opt) alignment
  help [COMMAND]                           print general help, or help on COMMAND
  mklabel,mktable LABEL-TYPE               create a new disklabel (partition table)
  mkpart PART-TYPE [FS-TYPE] START END     make a partition
  name NUMBER NAME                         name partition NUMBER as NAME
  print [devices|free|list,all|NUMBER]     display the partition table, available devices, free
        space, all found partitions, or a particular partition
  quit                                     exit program
  rescue START END                         rescue a lost partition near START and END
  resizepart NUMBER END                    resize partition NUMBER
  rm NUMBER                                delete partition NUMBER
  select DEVICE                            choose the device to edit
  disk_set FLAG STATE                      change the FLAG on selected device
  disk_toggle [FLAG]                       toggle the state of FLAG on selected device
  set NUMBER FLAG STATE                    change the FLAG on partition NUMBER
  toggle [NUMBER [FLAG]]                   toggle the state of FLAG on partition NUMBER
  unit UNIT                                set the default unit to UNIT
  version                                  display the version number and copyright information of
        GNU Parted
(parted) quit
Information: You may need to update /etc/fstab.

root@RMVMLNC0:/dev/mapper# resize2fs -p /dev/sda1
resize2fs 1.44.1 (24-Mar-2018)
Filesystem at /dev/sda1 is mounted on /; on-line resizing required
old_desc_blocks = 4, new_desc_blocks = 16
The filesystem on /dev/sda1 is now 32714587 (4k) blocks long.

root@RMVMLNC0:/dev/mapper# lsblk
NAME   MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
sda      8:0    0   132G  0 disk
└─sda1   8:1    0 124,8G  0 part /
sr0     11:0    1  1024M  0 rom
root@RMVMLNC0:/dev/mapper# df
Filesystem     1K-blocks     Used Available Use% Mounted on
udev              988600        0    988600   0% /dev
tmpfs             204040     1032    203008   1% /run
/dev/sda1      128672312 15153848 107932404  13% /
tmpfs            1020184       16   1020168   1% /dev/shm
tmpfs               5120        0      5120   0% /run/lock
tmpfs            1020184        0   1020184   0% /sys/fs/cgroup
tmpfs             204036        0    204036   0% /run/user/1000
root@RMVMLNC0:/dev/mapper# df
Filesystem     1K-blocks     Used Available Use% Mounted on
udev              988600        0    988600   0% /dev
tmpfs             204040     1044    202996   1% /run
/dev/sda1      128672312 15554628 107531624  13% /
tmpfs            1020184       16   1020168   1% /dev/shm
tmpfs               5120        0      5120   0% /run/lock
tmpfs            1020184        0   1020184   0% /sys/fs/cgroup
tmpfs             204036        0    204036   0% /run/user/1000
root@RMVMLNC0:/dev/mapper#
