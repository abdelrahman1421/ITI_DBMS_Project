#!/bin/bash

shopt -s extglob

read -p "Enter Database name: " database

messg="\n\t\tYou're in $database database" 

cd ./DBMS/$database 2>> /dev/null

if [ $? == 0 ]
then
    echo -e $messg
    

               echo -n "
    ################(table-menu)##################
   ||                                            ||
   ||                                            ||
   || (1) Create Table                           ||
   || (2) List Table                             ||
   || (3) Drop Table                             ||
   || (4) Insert to Table                        ||
   || (5) Select from Table                      ||
   || (6) Delete from Table                      ||
   || (7) Update Table                           ||
   || (8) Exit                                   ||
   ||                                            ||
   ||                                            ||
     #############################################
"

        while true
        do

        read -p "($database)--> Please select a choice: "

                
                typeset -i REPLY=$REPLY

                if [ $REPLY -eq 1 ] 
                then
                        # Creating a new table
                       
                        source ../../createTable.sh
                        
                elif [ $REPLY -eq 2 ]
                then
                        # List all tables
                        ls ./
                        
                        
                elif [ $REPLY -eq 3 ]
                then
                        # Drop table
                        source  ../../dropDB.sh
                        

                elif [ $REPLY -eq 4 ]
                then
                      # Insert to table
                      
		        source ../../insertIntoTable.sh


                elif [ $REPLY -eq 5 ]
                then
                        # Select from table
                        
                        source ../../selectfromtable.sh

                elif [ $REPLY -eq 6 ]
                then
                        # Delete from table
                        
                        source ../../deleteField.sh

  
  
                elif [ $REPLY -eq 7 ]
                then
                        # update table
                        
                        source ../../updateTable.sh



                elif [ $REPLY -eq 8 ]
                then

                              
                        break
                        
                        
                else
                        
                        echo "Please select a number from the Menu" 
                fi

        done

         cd ../../
         source ./main.sh  

else
    
    echo -e "error! there is no Database with this name."
fi



