#!/bin/bash

# Hello this will be our main file for DBMS project based on bash script

messg="\n \t Welcome to DBMS based on bash script\n"

if [ -d DBMS ]
then
    echo -e $messg
else
    mkdir ./DBMS
    echo -e $messg
fi

        echo -n "
    ====================(Menu)====================
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

        if [ $REPLY -eq 1 ]
        then
                echo "Create Database"
                
        elif [ $REPLY -eq 2 ]
        then
                echo "List Database"
                

        elif [ $REPLY -eq 3 ]
        then
                echo "Connect to Database"
                

        elif [ $REPLY -eq 4 ]
        then
                read -p " Enter Database name: " rmdname 

                case $rmdname in

                    +[A-Za-z])
                        
                            if [ -d $rmdname ]
                            then
                        
                                rm -r ./DBMS/$rmdname
                                echo "Done! $rmdname  database was Deleted.."
                        
                            else
                                echo "There is no Database with this name !!"
                            fi
                            ;;      
        
                    *)
                    
                            echo "invalid Database name: "
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

