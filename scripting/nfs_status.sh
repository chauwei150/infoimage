#!/bin/bash
#
# Define list of servers
SERVERS=("10.10.10.9" "10.10.10.10")

key="~/.ssh/Infoimage.pem"

# Define alert function
send_alert() {
    local message=$1
    echo "Alert: $message" | mail -s "Resource Alert" your_email@example.com
}

# Function to check resources on a server
check_resources() {
    local server=$1

    # MOUNT status
    #ALL_MOUNTs_STATUS=$(ssh -i $key $server "findmnt -A")
    #echo "ALL_MOUNTs_STATUS = "
    #echo "$ALL_MOUNTs_STATUS"
    #echo
    FSTAB_MOUNTs_STATUS=$(ssh -i $key $server "findmnt -D -t nosquashfs,notmpfs,nodevtmpfs")
    echo "FSTAB_MOUNTs_STATUS = "
    echo "$FSTAB_MOUNTs_STATUS"
    echo
    # Get NFS MOUNT status
    NFS_MOUNTs_STATUS=$(ssh -i $key $server "mount |grep nfs")
    echo "NFS_MOUNTs_STATUS = "
    echo "$NFS_MOUNTs_STATUS"
    echo

 
    # Get Memory usage
#    MEM_USAGE=$(ssh -i $key $server "free | grep Mem | awk '{print \$3/\$2 * 100.0}'")
#    echo "MEM_USAGE = $MEM_USAGE"


    # Check CPU usage
        send_alert "NFS_MOUNT_STATUS on $server : ${NFS_MOUNT_STATUS}%"
}

# Iterate over the list of servers and check resources
for server in "${SERVERS[@]}"; do
    echo "Server is $server"
    check_resources $server
done
