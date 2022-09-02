#!/bin/bash

dorpDB()
{
read -p "Please enter the database name you want to drop: " drop_db_name


search_drop_db_name=`find ./DBMS/ -type f -name $drop_db_name | rev | awk -F'/' '{ print $1 }' | rev`
db_path=`find ./DBMS/ -type f -name $drop_db_name`

if [ "$drop_db_name" = "$search_drop_db_name" ]
    then 
      echo -n -e "
       ====================(Drop)=================
      |                                           |
      |                                           |
      | (1) Cofirm dropping '$search_drop_db_name'  
      | (2) Cancel                                |
      |                                           |
      |                                           |
       ===========================================  \n\n"

        while true
            do

             read -p "Please confirm that action or cancel droping: " 
                
             typeset -i rep=$REPLY
            if [ $rep -eq 1 ] 
                then
                    rm -r $db_path
                    echo "------------------------------------------------------------------------------"
                    echo -e "\nDatabase was successfully dropped.\n"
                    echo "------------------------------------------------------------------------------"
                elif [ $REPLY -eq 2 ]
                    then
                         echo "------------------------------------------------------------------------------"
                         echo -e "\nDrop database was canceled.\n"
                         echo "------------------------------------------------------------------------------"
                else
                    echo "------------------------------------------------------------------------------"
                    echo -e "Please select a number from the Menu.\n"
                    echo "------------------------------------------------------------------------------"
            fi

            break
        done

        
    else
            echo "------------------------------------------------------------------------------"
            echo -e "\nDatabase not found.\n"
            echo "------------------------------------------------------------------------------"

fi
}

dorpDB


   