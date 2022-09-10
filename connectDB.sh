#!/bin/bash

shopt -s extglob
pwd
read -p "Enter Database name: " database

messg="\n\t\tYou're in $database database" 

cd ./DBMS/$database 2>> /dev/null

if [ $? == 0 ]
then
    echo -e $messg
    

        echo -n "
    ====================(Table Menu)==============
    |                                            |
    |                                            |
    | (1) Create Table                           |
    | (2) List Table                             |
    | (3) Drop Table                             |
    | (4) Insert to Table                        |
    | (5) Select from Table                      |
    | (6) Delete from Table                      |
    | (7) Update Table                           |
    | (8) Exit                                   |
    |                                            |
    |                                            |
    ==============================================
"

        while true
        do

        read -p "($database)--> Please select a choice: "

                
                typeset -i REPLY=$REPLY

                if [ $REPLY -eq 1 ] 
                then
                        # Creating a new table
                        echo "Creating a new table"
                        source /home/abdo/project/createTable.sh
                        
                elif [ $REPLY -eq 2 ]
                then
                        # List all tables
                        ls ./
                        
                        
                elif [ $REPLY -eq 3 ]
                then
                        # Drop table
                        echo "Drop table"
                        

                elif [ $REPLY -eq 4 ]
                then
                      # Insert to table
                      echo "Insert to Table"


                elif [ $REPLY -eq 5 ]
                then
                        # Select from table
                        echo "Select from Table"
                        source /home/abdo/project/selectfromtable.sh

                elif [ $REPLY -eq 6 ]
                then
                        # Delete from table
                        echo "Delete from Table"

  
  
                elif [ $REPLY -eq 7 ]
                then
                        # update table
                        echo "Update Table"
                        source /home/abdo/project/updateTable.sh



                elif [ $REPLY -eq 8 ]
                then

                              
                        break
                        
                        
                else
                        
                        echo "Please select a number from the Menu" 
                fi

        done

         cd ../../
         source ./main_file.sh  

else
    
    echo -e "error! there is no Database with this name."
fi



