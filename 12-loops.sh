#!/bin/bash

USERID=$(id -u)
R="\e[31m"
N="\e[0m"

if [ $USERID -ne 0 ];
then 
     echo -e "$R ERROR:: Please run this script with root access $N"
     exit 1
fi

#All arguments are in $@
for i in $@ 
do
   yum install $i -y
done

#improvements implement log files, colors, validations through functions.
#your script should check package is already installed or not, if already installed print with yellow color.
#if installed just print package is already installed, it should not run install command again


