#!/bin/bash

create_dbm ()
{
read -p "Please ENter the name of your data base: " dbm_name

check=`find $HOME/DBMS -type d -name $dbm_name`

if [ "$check" = "$HOME/DBMS/$dbm_name" ]
then
        echo "Erorr creating Database it's already exixt."
else
        mkdir $HOME/DBMS/$dbm_name
        echo "Database $dbm_name dreated successfulty."

fi
}
create_dbm


