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
    ====================(Main Menu)===============
    |                                            |
    |                                            |
    | (1) Create Database                        |
    | (2) List Databases                         |
    | (3) Connect to Database                    |
    | (4) Drop Database                          |
    | (5) Exit                                   |
    |                                            |
    |                                            |
    ==============================================
"

while true
do

    read -p "Please select a choice: "

        
        typeset -i REPLY=$REPLY

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
                read -p "Enter Database name: " rmdname 

                case $rmdname in

                    +([A-Za-z]))
                        
                            if [ -d ./DBMS/$rmdname ]
                            then
                        
                                rm -rf ./DBMS/$rmdname
                                echo -e "Done!!\n$rmdname  database was Deleted.."
                        
                            else
                                echo -e "There is no Database with this name !!\n"
                            fi
                            ;;      
        
                    *)

                            echo -e "Invalid Database name!! \n"
                            ;;      
        
                esac
                

        elif [ $REPLY -eq 5 ]
        then
                exit
                break

        else
                
                echo "Please select a number from the Menu" 
        fi

done




