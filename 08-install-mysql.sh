#!/bin/bash

# our program goal is to install mysql

USERID=$(id -u) # First to get the user id 

if [ $USERID -ne 0 ]  #-ne means not equal to 
then 
    echo "ERROR:: Please run this script with root access"
    exit 1 # if it finds exit other than 0, then it will come out of flow immediately 
fi

yum install mysql

