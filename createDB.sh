#!/bin/bash

shopt -s extglob

read -p "Please enter Database name: " db_name
name_handle=` echo $db_name | tr -d " " `	

case $name_handle in

    +([A-Za-z]))


		if [ -d ./DBMS/"$name_handle" ]
		then
				echo -e "erorr! ($name_handle) is already exist. \n"
					source	./createDB.sh
		else

				mkdir ./DBMS/$name_handle

				echo -e "Database ($name_handle) created successfulty. \n"

		fi          

		  ;;
	*)
		echo "invalid Database name !!"
		source ./createDB.sh

          ;;
esac

	



