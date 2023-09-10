#!/bin/bash

DATE=$(date +%F)
SCRIPT_NAME=$0
#log file will be created inside tmp folder on script name with which date it got executed  
LOGFILE=/tmp/$SCRIPT_NAME-$DATE.log 
# Now i want to append all the output to this log file 

#This function should validate the previous command and inform user it is success or failure
VALIDATE(){
if [ $1 -ne 0 ]
then 
     echo " $2 ... Failure"
     exit 1
else
     echo " $2 ... Success"
fi
} 

USERID=$(id -u) # First to get the user id

if [ $USERID -ne 0 ]  #-ne means not equal to 
then 
    echo "ERROR:: Please run this script with root access"
    exit 1 # if it finds exit other than 0, then it will come out of flow immediately 
fi

#it is our responsibility again to check installation is success or not
yum install mysql -y &>>$LOGFILE

VALIDATE $? "Installing MySQL"

yum install postfix -y &>>$LOGFILE

VALIDATE $? "Installing postfix"




