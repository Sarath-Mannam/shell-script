#!/bin/bash

#This is called as array, instead of single value it can hold multiple values
PERSONS=("Ramesh" "Suresh" "Sachin")
#Inside array we always refer values with index and it starts from 0.
#If we want first person
echo "First Person: ${PERSONS[0]}"

echo "First Person: ${PERSONS[@]}"
