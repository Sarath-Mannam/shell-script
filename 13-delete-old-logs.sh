#!/bin/bash
APP_LOGS_DIR=/home//centos/app-logs
DATE=$(date +%F)
#If your manager or client asks what are the files you deleted last week, so then we have to show shell script log files
LOGSDIR=/home/centos/shellscript-logs
SCRIPT_NAME=$0
LOGFILE=$LOGSDIR/$0-$DATE.log

FILES_TO_DELETE=$(find $APP_LOGS_DIR -name "*.log" -type f -mtime +10)

echo "$FILES_TO_DELETE"