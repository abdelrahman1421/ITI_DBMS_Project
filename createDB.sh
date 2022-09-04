#!/bin/bash

create_dbm () {
		read -p "Please enter Database name: " db_name
		chdb=` echo $db_name | tr -d "[:space:]" `		#this command is to remove spaces form entered name from user#
		echo $chdb
		
		check=` find ./DBMS -type d -name $chdb `

		if [[ "$chdb" != *[!a-zA-Z]* ]]
		then
			echo not valid
		fi

		if [ "$check" = "./DBMS/$chdb" ]
		then
       			 echo -e "erorr! $chdb is already exist. \n" 
		else

       			mkdir ./DBMS/$chdb

        		echo -e "Database $chdb created successfulty. \n"

		fi
}

create_dbm


