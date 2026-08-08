#!/bin/bash

nginx_file=$1
COUNTS=5

echo -e "\n ---------"
awk '{print $1}' $nginx_file | sort | uniq -c | sort -nr | awk '{print $2 " - " $1 " requests"}' | head -n ${COUNTS}

echo -e "\n ---------"
awk '{print $7}' $nginx_file | sort | uniq -c | sort -nr | awk '{print $2 " - " $1 " requests"}' | head -n ${COUNTS}

echo -e "\n ---------"
grep -oE ' [1-5][0-9]+ ' $nginx_file | sort | uniq -c | sort -nr | awk '{print $2 " - " $1 " requests"}' | head -n ${COUNTS}

echo -e "\n ---------"
awk -F '"' '{print $6}' $nginx_file | sort | uniq -c | sort -nr  | awk '{for(i=2;i<=NF;i++){ printf "%s ", $i} print "-" ,$1, "requests" }' | head -n ${COUNTS} 