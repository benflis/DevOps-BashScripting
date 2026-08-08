#!/bin/bash
echo "Server Statistics"
echo "-----------------"
# Get CPU usage

top -l 1 -n 0 | awk '
/CPU usage/ {
    for (i = 1; i <= NF; i++) {
        if ($i == "idle") {
            idle = $(i - 1)
            gsub("%", "", idle)
        }
    }
    printf "CPU Usage: %.1f%%\n", 100 - idle
}

/PhysMem/ {
    for (i = 1; i <= NF; i++) {
        if ($i == "used") {
            used_mem = $(i - 1)
            unit = used_mem
            gsub(/[0-9.]/, "", unit)
            gsub(/[A-Za-z]/, "", used_mem)
        }
        if ($i ~ /^unused/) {
            unused_mem = $(i - 1)
            unused_unit = unused_mem
            gsub(/[0-9.]/, "", unused_unit)
            gsub(/[A-Za-z]/, "", unused_mem)
        }
    }
    
    used_mb = (unit == "G") ? used_mem * 1024 : used_mem
    unused_mb = (unused_unit == "G") ? unused_mem * 1024 : unused_mem
    total_mb = used_mb + unused_mb

    printf "Memory Usage: %.1f%s\n", used_mem, unit
    printf "Memory Usage Percentage: %.1f%%\n", (used_mb / total_mb) * 100
    printf "Memory Free: %.1f%s\n", unused_mem, unused_unit
    printf "Memory Free Percentage: %.1f%%\n", (unused_mb / total_mb) * 100

}'

df -h / | awk ' NR == 2 {
    total = $2
    available= $4
    used = $3
    used_unit = used
    total_unit = total
    available_unit = available
    gsub(/[0-9]./, "", total_unit)
    gsub(/[0-9.]/, "", total_unit)
    gsub(/[0-9.]/, "", available_unit)
    gsub(/[A-Za-z]/, "", used)
    gsub(/[A-Za-z]/, "", total)
    gsub(/[A-Za-z]/, "", available)

    printf "Total Storage: %.1f%s\n", total, total_unit
    printf "Available Storage: %.1f%s\n", available, available_unit
    printf "Used Storage: %.1f%s\n", used, used_unit

    used_mb = (unit == "G") ? used * 1024 : used
    unused_mb = (unused_unit == "G") ? available * 1024 : available
    total_mb= (total_unit == "G")? total * 1024 : total


    printf "Available Storage Percentage: %.1f%%\n", (unused_mb * 100/total_mb)
    printf "Used Storage Percentage: %.1f%%\n", (used_mb * 100/total_mb)


}'
echo -e "----------------------- \n"
echo "Top 5 Processes by CPU"
echo -e "------------- \n"

top -l 2 -n 5 -o cpu | awk '/^PID/ {
        header_count++
        
        if(header_count==2){
            
            printf "%s %s %s \n", $1, $2 ,$(NF - 34)
            count=5
            next
        }


    }

    count > 0 && header_count == 2 {
        printf "%s %s %s \n", $1, $2 ,$(NF - 34)
        count--
    }
'


echo -e "----------------------- \n"
echo "Top 5 Processes by Memory"
echo -e "------------- \n"
top -l 2 -n 5 -o mem | awk '/^PID/ {
        header_count++
        
        if(header_count==2){
            
            printf "%s %s %s \n", $1, $2 ,$(NF - 29)
            count=5
            next
        }


    }

    count > 0 && header_count == 2 {
        printf "%s %s %s \n", $1, $2 ,$(NF - 29)
        count--
    }
'
