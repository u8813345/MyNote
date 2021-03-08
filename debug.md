## Enable debug message

```
## redis-cli -s /run/redis/redis.sock SET Redfish:DebugPrint true 
## /etc/init.d/redfish-server stop 
## /etc/init.d/sync-agent stop 
## redis-cli -s /run/redis/redis.sock DEL Redfish:AccountService:ServiceEnabled 
## redis-cli -s /run/redis/redis.sock KEYS "*Redfish:*" | xargs redis-cli -s /run/redis/redis.sock DEL 
## /etc/init.d/redfish-server start 
## /etc/init.d/sync-agent start 
```

## How to update in U-boot

```
U-Boot 2013.07:
$ dhcp; setenv serverip 10.46.1.120; tftp 0x82000000 colin/rom.ima ; protect off all; erase bank 1; cp.b 0x82000000 0x20000000 4000000
U-Boot 2019.04:
$ setenv colin "dhcp; setenv serverip 10.46.1.120; tftp 0x83000000 colin/rom.ima"
$ setenv colin1 "sf probe 0; sf protect unlock 0 0x4000000; sf update 0x83000000 0 0x4000000"
$ save
$ run colin colin1; save
U-Boot aspeed_bsp(06.01):
$ setenv colin "setenv serverip 10.46.1.120; setenv bootfile colin/rom.ima; dhcp "
$ setenv colin1 "sf probe 0; sf protect unlock 0 0x4000000; sf update 0x83000000 0 0x1000000"
$ run colin colin1
```


## U-boot helpful command
### read memory (SCU)
#### read MCU multi function pin control
```
$ md.l 0x1e6e2000 0x200
```


## Git command 

### 暫存
```
$ git stash
$ git stash pop
```

### How to generate a `git patch` for a specific commit
```
$ git format-patch -1 <sha1>
$ git apply <patch file>
```

```
$ git apply <patch file> --reject
$ git status
$ git add FIXED_FILES
$ git am --resolved
```



## How to compact vdi file

### Guset OS (ubuntu)
```
$sudo su
$umount /home/colin/eerai
$zerofree -v /dev/sde1
$poweroff
```
### Host OS (win10)
```"
c:\Program Files\Oracle\VirtualBox\VBoxManage.exe"  modifymedium --compact "C:\Users\colin.huang\VirtualBox VMs\zBMC\eera1.vdi"
```

## How to change the disk lable name in linux
```
$ sudo e2label /dev/device
$ sudo e2label /dev/device new-label-name-here
```
refer to: [here](https://www.cyberciti.biz/faq/linux-modify-partition-labels-command-to-change-diskname/)


## How to add the second hdd image for vbox.
```
$ sudo gparted
1. select your disk  (my case /dev/sdj)
2. Device -> Create Partation Table
    msdos or gpt  (i use gpt)
4. Partition -> New
    Lebel : <file name of vdi>
5. click apply all
6. close window
$ sudo blkid
$ sudo vim /etc/fstab
reboot
$ sudo chown -R colin:colin /home/colin/<mount point>
```


## How to buid spedev_text tool under kernel tool folder
```
$PATH=/home/xyz/spx/workspace/XXXX_workspace/tools/arm-soft-linux-gnueabi/bin:$PATH
$make ARCH=arm CROSS_COMPILE=arm-soft-linux-gnueabi- tools/spi

```
