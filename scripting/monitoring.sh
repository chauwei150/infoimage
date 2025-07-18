#!/bin/bash

Device=$1

# Define thresholds
CPU_THRESHOLD=80
MEM_THRESHOLD=80
DISK_THRESHOLD=80

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
    local Device=$2

    # Get CPU usage 
    if [ $Device = "cpu" ]; then
      CPU_USAGE=$(ssh -i $key $server "top -bn1 | grep 'Cpu(s)' | sed 's/.*, *\([0-9.]*\)%* id.*/\1/' | awk '{print 100 - \$1}'")
      echo "CPU_USAGE = $CPU_USAGE"

      # Check CPU usage
      if (( $(echo "$CPU_USAGE > $CPU_THRESHOLD" | bc -l) )); then
        send_alert "CPU usage on $server is above threshold: ${CPU_USAGE}%"
      fi


    # Get Memory usage
    elif [ $Device = "memory" ]; then
      MEM_USAGE=$(ssh -i $key $server "free | grep Mem | awk '{print \$3/\$2 * 100.0}'")
      echo "MEM_USAGE = $MEM_USAGE"

      # Check Memory usage
      if (( $(echo "$MEM_USAGE > $MEM_THRESHOLD" | bc -l) )); then
        send_alert "Memory usage on $server is above threshold: ${MEM_USAGE}%"
      fi


    # Get Disk usage
    elif [ $Device = "disk" ]; then
      DISK_USAGE=$(ssh -i $key $server "df / | grep / | awk '{print \$5}' | sed 's/%//'")
      echo "DISK_USAGE = $DISK_USAGE"

      # Check Disk usage
      if (( $DISK_USAGE > $DISK_THRESHOLD )); then
        send_alert "Disk usage on $server is above threshold: ${DISK_USAGE}%"
      fi
    #Get NFS status
    elif [ $Device = "nfs" ]; then
     # get Info from fstab         
      FSTAB_MOUNTs_STATUS=$(ssh -i $key $server "findmnt -D -t nosquashfs,notmpfs,nodevtmpfs")
      echo "FSTAB_MOUNTs_STATUS = "
      echo "$FSTAB_MOUNTs_STATUS"
      echo
      # Get NFS MOUNT status
      NFS_MOUNTs_STATUS=$(ssh -i $key $server "mount |grep nfs")
      echo "NFS_MOUNTs_STATUS = "
      echo "$NFS_MOUNTs_STATUS"
      echo
    else
      # Get CPU usage 
      CPU_USAGE=$(ssh -i $key $server "top -bn1 | grep 'Cpu(s)' | sed 's/.*, *\([0-9.]*\)%* id.*/\1/' | awk '{print 100 - \$1}'")
      echo "CPU_USAGE = $CPU_USAGE"

      # Check CPU usage
      if (( $(echo "$CPU_USAGE > $CPU_THRESHOLD" | bc -l) )); then
        send_alert "CPU usage on $server is above threshold: ${CPU_USAGE}%"
      fi


     # Get Memory usage
      MEM_USAGE=$(ssh -i $key $server "free | grep Mem | awk '{print \$3/\$2 * 100.0}'")
      echo "MEM_USAGE = $MEM_USAGE"

      # Check Memory usage
      if (( $(echo "$MEM_USAGE > $MEM_THRESHOLD" | bc -l) )); then
        send_alert "Memory usage on $server is above threshold: ${MEM_USAGE}%"
      fi


     # Get Disk usage
      DISK_USAGE=$(ssh -i $key $server "df / | grep / | awk '{print \$5}' | sed 's/%//'")
      echo "DISK_USAGE = $DISK_USAGE"

      # Check Disk usage
      if (( $DISK_USAGE > $DISK_THRESHOLD )); then
        send_alert "Disk usage on $server is above threshold: ${DISK_USAGE}%"
      fi

    # Get Info from fstab
      FSTAB_MOUNTs_STATUS=$(ssh -i $key $server "findmnt -D -t nosquashfs,notmpfs,nodevtmpfs")
      echo "FSTAB_MOUNTs_STATUS = "
      echo "$FSTAB_MOUNTs_STATUS"
      echo
    # Get NFS MOUNT status
      NFS_MOUNTs_STATUS=$(ssh -i $key $server "mount |grep nfs")
      echo "NFS_MOUNTs_STATUS = "
      echo "$NFS_MOUNTs_STATUS"
      echo

    fi

}
# Iterate over the list of servers and check resources
for server in "${SERVERS[@]}"; do
    echo "Server is $server"
    check_resources $server $1
done
