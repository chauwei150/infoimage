
###ubuntu@ip-10-10-10-9:~/scripting$ bash monitoring.sh memory

Server is 10.10.10.9

MEM_USAGE = 42.0922

Server is 10.10.10.10

MEM_USAGE = 53.3825

###ubuntu@ip-10-10-10-9:~/scripting$ bash monitoring.sh cpu

Server is 10.10.10.9

CPU_USAGE = 0

Server is 10.10.10.10

CPU_USAGE = 4.8

###ubuntu@ip-10-10-10-9:~/scripting$ bash monitoring.sh disk

Server is 10.10.10.9

DISK_USAGE = 58

Server is 10.10.10.10

DISK_USAGE = 65

###ubuntu@ip-10-10-10-9:~/scripting$ bash monitoring.sh nfs
Server is 10.10.10.9

FSTAB_MOUNTs_STATUS = 

SOURCE                 FSTYPE   SIZE   USED  AVAIL USE% TARGET

/dev/nvme0n1p1         ext4     6.7G   3.9G   2.8G  58% /

/dev/nvme0n1p16        ext4   880.4M 147.3M 671.5M  17% /boot

/dev/nvme0n1p15        vfat   104.3M   6.1M  98.2M   6% /boot/efi

10.10.10.10:/dev/utils nfs4                             /root/ansible/utils

10.10.10.10:/dev/utils nfs4   447.1M      0 447.1M   0% /mnt/utils



NFS_MOUNTs_STATUS = 

10.10.10.10:/dev/utils on /root/ansible/utils type nfs4 (rw,relatime,vers=4.2,rsize=131072,wsize=131072,namlen=255,hard,proto=tcp,timeo=600,retrans=2,sec=sys,clientaddr=10.10.10.9,local_lock=none,addr=10.10.10.10)

10.10.10.10:/dev/utils on /mnt/utils type nfs4 
(rw,relatime,vers=4.2,rsize=131072,wsize=131072,namlen=255,hard,proto=tcp,timeo=600,retrans=2,sec=sys,clientaddr=10.10.10.9,local_lock=none,addr=10.10.10.10)


Server is 10.10.10.10
FSTAB_MOUNTs_STATUS = 
SOURCE                 FSTYPE   SIZE   USED  AVAIL USE% TARGET
/dev/nvme0n1p1         ext4     6.7G   4.3G   2.4G  64% /
/dev/nvme0n1p16        ext4   880.4M 147.3M 671.5M  17% /boot
/dev/nvme0n1p15        vfat   104.3M   6.1M  98.2M   6% /boot/efi
10.10.10.10:/dev/utils nfs4   447.1M      0 447.1M   0% /home/ubuntu/utils

NFS_MOUNTs_STATUS = 
nfsd on /proc/fs/nfsd type nfsd (rw,relatime)
10.10.10.10:/dev/utils on /home/ubuntu/utils type nfs4 (rw,relatime,vers=4.2,rsize=131072,wsize=131072,namlen=255,hard,proto=tcp,timeo=600,retrans=2,sec=sys,clientaddr=10.10.10.10,local_lock=none,addr=10.10.10.10)


###ubuntu@ip-10-10-10-9:~/scripting$ bash monitoring.sh all

Server is 10.10.10.9
CPU_USAGE = 4.8
MEM_USAGE = 42.7904
DISK_USAGE = 58
FSTAB_MOUNTs_STATUS = 
SOURCE                 FSTYPE   SIZE   USED  AVAIL USE% TARGET
/dev/nvme0n1p1         ext4     6.7G   3.9G   2.8G  58% /
/dev/nvme0n1p16        ext4   880.4M 147.3M 671.5M  17% /boot
/dev/nvme0n1p15        vfat   104.3M   6.1M  98.2M   6% /boot/efi
10.10.10.10:/dev/utils nfs4                             /root/ansible/utils
10.10.10.10:/dev/utils nfs4   447.1M      0 447.1M   0% /mnt/utils

NFS_MOUNTs_STATUS = 
10.10.10.10:/dev/utils on /root/ansible/utils type nfs4 (rw,relatime,vers=4.2,rsize=131072,wsize=131072,namlen=255,hard,proto=tcp,timeo=600,retrans=2,sec=sys,clientaddr=10.10.10.9,local_lock=none,addr=10.10.10.10)
10.10.10.10:/dev/utils on /mnt/utils type nfs4 (rw,relatime,vers=4.2,rsize=131072,wsize=131072,namlen=255,hard,proto=tcp,timeo=600,retrans=2,sec=sys,clientaddr=10.10.10.9,local_lock=none,addr=10.10.10.10)

Server is 10.10.10.10
CPU_USAGE = 4.8
MEM_USAGE = 55.7763
DISK_USAGE = 65
FSTAB_MOUNTs_STATUS = 
SOURCE                 FSTYPE   SIZE   USED  AVAIL USE% TARGET
/dev/nvme0n1p1         ext4     6.7G   4.3G   2.4G  64% /
/dev/nvme0n1p16        ext4   880.4M 147.3M 671.5M  17% /boot
/dev/nvme0n1p15        vfat   104.3M   6.1M  98.2M   6% /boot/efi
10.10.10.10:/dev/utils nfs4   447.1M      0 447.1M   0% /home/ubuntu/utils

NFS_MOUNTs_STATUS = 
nfsd on /proc/fs/nfsd type nfsd (rw,relatime)
10.10.10.10:/dev/utils on /home/ubuntu/utils type nfs4 (rw,relatime,vers=4.2,rsize=131072,wsize=131072,namlen=255,hard,proto=tcp,timeo=600,retrans=2,sec=sys,clientaddr=10.10.10.10,local_lock=none,addr=10.10.10.10)

