#!/bin/bash

read -p "Please enter Database name: " db_name
chdb=` echo $db_name | tr -d "[:space:]" `		#this command is to remove spaces form entered name from user#

#This condition is to check if the entered name has special chracters or no

echo $chdb

if [[ $chdb =~ ['!@#$%^&*()_+'] ]]; 
then
    echo yes
else
    echo no
fi
