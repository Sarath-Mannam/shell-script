#!/bin/bash
# check if the number is greater than 10 or not
Number=$1  # i will take one number from user through command line

if [ $Number -gt 10 ] # in shell scripting -gt means greater than
then 
    echo "$Number is greater than 10"
else 
    echo "$Number is less than 10"
fi                                 # to end the script we use fi


