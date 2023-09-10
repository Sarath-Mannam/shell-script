#!/bin/bash

# our program goal is to install mysql

USERID=$(id -u) # First to get the user id 

if [ $USERID -ne 0 ]  #-ne means not equal to 
then 
    echo "ERROR:: Please run this script with root access"
fi

yum install git -y

