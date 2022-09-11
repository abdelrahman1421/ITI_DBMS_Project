#!/bin/bash

shopt -s extglob

read -p "Enter Database name: " database


messg="\n\t\t\t\tYou're in $database database"




        case $database in

        +([A-Za-z]))

        
                cd ./DBMS/$database 2>> /dev/null

                if [ $? -eq 0 ]
                then

                        echo -e $messg
                        . ../../tableMenu.sh
                        

                fi

                        ;;
                
               
        * )

                echo -e "error! there is no Database with this name."
                
                source ./connectDB.sh
                        ;;
                                        

        esac








