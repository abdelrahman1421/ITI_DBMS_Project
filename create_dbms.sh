#!/bin/bash

create_dbm () {
		read -p "Please enter Database name: " db_name

		check=`find ./DBMS -type d -name $db_name`

		if [ "$check" = "./DBMS/$db_name" ]
		then
       			 echo -e "erorr! $db_name is already exist. \n" 
		else

       			mkdir ./DBMS/$db_name

        		echo -e "Database $db_name created successfulty. \n"

		fi
}

create_dbm


