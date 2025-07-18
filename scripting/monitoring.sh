#!/bin/bash

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

    # Get CPU usage
    CPU_USAGE=$(ssh -i $key $server "top -bn1 | grep 'Cpu(s)' | sed 's/.*, *\([0-9.]*\)%* id.*/\1/' | awk '{print 100 - \$1}'")
    echo "CPU_USAGE = $CPU_USAGE"
    
    # Get Memory usage
    MEM_USAGE=$(ssh -i $key $server "free | grep Mem | awk '{print \$3/\$2 * 100.0}'")
    echo "MEM_USAGE = $MEM_USAGE"

    # Get Disk usage
    DISK_USAGE=$(ssh -i $key $server "df / | grep / | awk '{print \$5}' | sed 's/%//'")
    echo "DISK_USAGE = $DISK_USAGE"

    # Check CPU usage
    if (( $(echo "$CPU_USAGE > $CPU_THRESHOLD" | bc -l) )); then
        send_alert "CPU usage on $server is above threshold: ${CPU_USAGE}%"
    fi

    # Check Memory usage
    if (( $(echo "$MEM_USAGE > $MEM_THRESHOLD" | bc -l) )); then
        send_alert "Memory usage on $server is above threshold: ${MEM_USAGE}%"
    fi

    # Check Disk usage
    if (( $DISK_USAGE > $DISK_THRESHOLD )); then
        send_alert "Disk usage on $server is above threshold: ${DISK_USAGE}%"
    fi
}

# Iterate over the list of servers and check resources
for server in "${SERVERS[@]}"; do
    echo "Server is $server"
    check_resources $server
done
