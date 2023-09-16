#!/bin/bash

#Anyone in the project can call this script with arguments
TO_ADDRESS=$1
SUBJECT=$2
BODY=$(sed -e 's/[]\/$*.^[]/\\&/g' <<< $3) # escaping pattern, escapes the  slashes 
echo "escaped content: $BODY"
TEAM_NAME=$4
ALERT_TYPE=$5

# echo "all args: $@"

# Replacing message with actual body.

FINAL_BODY=$(sed -e "s/TEAM_NAME/$TEAM_NAME/g" -e "s/ALERT_TYPE/$ALERT_TYPE/g" -e "s/MESSAGE/$BODY/g" template.html) 

# $ Will work only with in ""

 echo "$FINAL_BODY"| mail -s "$SUBJECT" "$TO_ADDRESS" # mail command
