#!/bin/bash

APP_LOGS_DIR=/home/centos/app-logs

DATE=$(date +%F:%H:%M:%S)

#If your manager or client asks what are the files you deleted last week, so then we have to show shell script log files
LOGSDIR=/home/centos/shellscript-logs

SCRIPT_NAME=$0
LOGFILE=$LOGSDIR/$SCRIPT_NAME-$DATE.log

FILES_TO_DELETE=$(find $APP_LOGS_DIR -name "*.log" -type f -mtime +10)

echo "Script started executing at $DATE" &>>$LOGFILE

#here we reading the input line by line and deleting it.
while read line
do
    echo "Deleting $line" &>>$LOGFILE #storing logs inside logfile because client has to know what are the files deleted
    rm -rf $line
done <<< $FILES_TO_DELETE  # < less than symbol indicates input of file FILES_TO_DELETE
# > Symbol is mening for output

echo "$message"| mail -s "High Disk usage" mannamsarath224@gmail.com