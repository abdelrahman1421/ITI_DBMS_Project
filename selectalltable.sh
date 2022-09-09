#!/bin/bash

selectalltable () 
{

read -p "Enter the table name" tbale_name
cat $tableName 
if [[ $? != 0]]
then
        echo "Something error"
fi
# add select menu function here

}

selectcolumn () 
{

read -p "Enter the table name" tbale_name
echo -e "\n"
read -p "Enter the cloumn num" column_num
awk '{print "$column_num"}'

# add select menu function here

}