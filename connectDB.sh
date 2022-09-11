#!/bin/bash

shopt -s extglob

read -p "Enter Database name: " database


messg="\n\t\t\t\tYou're in ($database) database"

#pwd


        case $database in

        +([A-Za-z]))

        
                #cd ./DBMS/$database 2>> /dev/null

                if [ -d ./DBMS/$database ]
                then

                        echo -e $messg

                        cd ./DBMS/$database
                        source ../../tableMenu.sh
                        

                else

                  echo -e "error! there is no Database with this name."
                  sleep 1                
                  source ./connectDB.sh                      

                fi

                        ;;
                
               
        * )

                echo -e "error! there is no Database with this name."
                sleep 1                
                source ./connectDB.sh
                        ;;
                                        

        esac








