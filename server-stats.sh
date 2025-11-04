#!/bin/bash

# Function to display title for the stats section
function display_title {
    echo "#########################################"
    echo "$1"
    echo "#########################################"
}

# 1. Display OS Version
display_title "OS Version"
cat /etc/os-release | grep -E 'NAME|VERSION'

# 2. Display System Uptime
display_title "System Uptime"
uptime -p

# 3. Display Load Average (1 min, 5 min, 15 min)
display_title "Load Average"
uptime | awk -F'load average:' '{ print $2 }'

# 4. Display Logged-in Users
display_title "Logged-in Users"
who

# 5. Display Failed Login Attempts (last 100 entries)
display_title "Failed Login Attempts (last 100)"
journalctl _COMM=sshd | grep "Failed password" | tail -n 100

# 6. Total CPU Usage
display_title "Total CPU Usage"
cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1 "%"}')
echo "CPU Usage: $cpu_usage"

# 7. Total Memory Usage (Free vs Used, including percentage)
display_title "Memory Usage"
memory_info=$(free -m)
used_mem=$(echo "$memory_info" | grep Mem: | awk '{print $3}')
total_mem=$(echo "$memory_info" | grep Mem: | awk '{print $2}')
free_mem=$(echo "$memory_info" | grep Mem: | awk '{print $4}')
memory_percent=$(echo "scale=2; ($used_mem / $total_mem) * 100" | bc)

echo "Total Memory: ${total_mem}MB"
echo "Used Memory: ${used_mem}MB"
echo "Free Memory: ${free_mem}MB"
echo "Memory Usage: $memory_percent%"

# 8. Total Disk Usage (Free vs Used, including percentage)
display_title "Disk Usage"
disk_usage=$(df -h / | tail -n 1)
echo "$disk_usage"

# 9. Top 5 Processes by CPU Usage
display_title "Top 5 Processes by CPU Usage"
top -bn1 | head -20 | grep "PID" -A 5 | grep -v "top" | awk '{print $1, $9, $12}' | sort -k2 -n -r | head -n 5

# 10. Top 5 Processes by Memory Usage
display_title "Top 5 Processes by Memory Usage"
top -bn1 | head -20 | grep "PID" -A 5 | grep -v "top" | awk '{print $1, $10, $12}' | sort -k2 -n -r | head -n 5
