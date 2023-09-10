#!/bin/bash

# our program goal is to install mysql

USERID=$(id -u) # First to get the user id
#This function should validate the previous command and inform user it is success or failure
VALIDATE(){
if [ $1 -ne 0 ]
then 
     echo "Installation ... Failure"
     exit 1
else
     echo "Installation ... Success"
fi
} 

if [ $USERID -ne 0 ]  #-ne means not equal to 
then 
    echo "ERROR:: Please run this script with root access"
    exit 1 # if it finds exit other than 0, then it will come out of flow immediately 
fi

#it is our responsibility again to check installation is success or not
yum install mysql -y

VALIDATE $?

yum install postfix -y

VALIDATE $?




