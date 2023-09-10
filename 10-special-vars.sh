#!/bin/bash

VAR1=$1
VAR2=$2

echo "script name: $0"

echo "variable 1: $VAR1"

echo "all vars: $@"

 # i want to understand how many variables i 've passed
echo "number of vars: $#" # here # - means how many number of variables passed.

# so these are called special variables.