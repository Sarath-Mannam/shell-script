#!/bin/bash
LOGFILE_DIRECTORY=/tmp
DATE=$(date +%F:%H:%M:%S)
SCRIPT_NAME=$0
LOGFILE=$LOGFILE_DIRECTORY/$SCRIPT_NAME-$DATE.log
message=""

R="\e[31m" G="\e[32m" N="\e[0m" Y="\e[33m"

DISK_USAGE=$(df -hT | grep -vE 'tmpfs|Filesystem')
DISK_USAGE_THRESHOLD=1

#IFS= means internal field seperator is space 
while IFS= read line
do
   # This command will give you usage in number format for comparision
   usage=$(echo $line | awk '{print $6}' | cut -d % -f1)
   # This command will give us partition
   partition=$(echo $line | awk '{print $1}')
   # Now we need to check whether it is more than threshold or not
   if [ $usage -gt $DISK_USAGE_THRESHOLD ];
   then
       message+="HIGH DISK USAGE On $partition: $usage\n"
    fi
done <<< $DISK_USAGE

echo -e "message: $message"

#echo "$message"| mail -s "High Disk usage" mannamsarath224@gmail.com

#How to call other scripts from your current script by giving "sh" and "script name"
sh mail.sh mannamsarath58@gmail.com "High Disk Usage" "$message" "DevOps Team" "High Disk Usage"
# When you are having spaces in the text better to use ""|''