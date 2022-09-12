#!/bin/bash


	read -p "Please enter the database name you want to Drop: " drop_db_name



    if [ -d ./DBMS/$drop_db_name ]
  	then 

        while true
        do

                            echo -n -e "
             #############(Drop Database)###############
           ||                                          ||
           ||                                          ||
           || (1) Cofirm dropping '$drop_db_name'               ||
           || (2) Cancel                               ||
           ||                                          ||
           ||                                          ||
             ##########################################  \n\n"

            read -p "Please confirm that action or cancel droping: " 
                
            typeset -i rep=$REPLY

            if [ $rep -eq 1 ] 
            then
                    rm -rf ./DBMS/$drop_db_name
                    echo "----------------------------------------------"
                    echo -e "Database was successfully dropped."
                    echo "----------------------------------------------"

            elif [ $REPLY -eq 2 ]
            then
                         echo "-----------------------------------------"
                         echo -e "Drop database was canceled."
                         echo "-----------------------------------------"
			 
			 

            else
                    echo "----------------------------------------------"
                    echo -e "Please select a number from the Menu."
                    echo "----------------------------------------------"

                    continue
            fi

            break

        done

        
    else
            echo "--------------------------------"
            echo -e "Database not found."
            echo "--------------------------------"

            

fi


sleep 3
clear
source ./main.sh




   
