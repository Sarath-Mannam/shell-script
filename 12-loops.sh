#!/bin/bash
DATE=$(date +%F)
LOGSDIR=/home/centos/shellscript-logs
SCRIPT_NAME=$0
LOGFILE=$LOGSDIR/$0-$DATE.log
USERID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

if [ $USERID -ne 0 ];
then 
     echo -e "$R ERROR:: Please run this script with root access $N"
     exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo -e "Installing $2 ... $R Failure $N"
        exit 1
    else 
         echo -e "Installing $2 ... $G Success $N"    
    fi     
}

#All arguments are in $@
for i in $@ 
do
   #before doing installation let us check whether it is installed or not 
   yum list installed $i &>>$LOGFILE #redirecting log lines into a log file 
   if [ $? -ne 0 ]
   then 
        echo "$i is not installed, let's install it" 
        #installation of package gives lot of log files, so we need to redirect to a log file
        yum install $i -y &>>$LOGFILE
        VALIDATE $? "$i"
    else 
        echo -e "$Y $i is already installed $N"
    fi    
done



