#!/bin/bash

shopt -s extglob


# Hello this will be our main file for DBMS project based on bash script

messg="\n \t Welcome to DBMS based on bash script"

if [ -d DBMS ]
then
    echo -e $messg
else
    mkdir ./DBMS
    echo -e $messg
fi

        echo -n "
    ################(Database-menu)###############
   ||                                            ||
   ||                                            ||
   || (1) Create Database                        ||
   || (2) List Databases                         ||
   || (3) Connect to Database                    ||
   || (4) Drop Database                          ||
   || (5) Exit                                   ||
   ||                                            ||
   ||                                            ||
    #############################################
"

while true
do



    read -p "Please select a choice: "


        case $REPLY in

        [1-5])
                

                if [ $REPLY -eq 1 ] 
                then
                        # Creating a new Database
                        
                        source ./createDB.sh
                        
                elif [ $REPLY -eq 2 ]
                then 
                        # List all Databases
                        source ./listDBs.sh
                        

                elif [ $REPLY -eq 3 ]
                then
                        # Connect to Database
                        source ./connectDB.sh
                        

                elif [ $REPLY -eq 4 ]
                then
                        # Remove Database
                        source ./dropDB.sh

                elif [ $REPLY -eq 5 ]
                then
                        # Exit from Program
                        exit

                fi
                      ;;

        *)
                echo "Please select a number from the Menu" 
                      ;;
                
        esac

done




