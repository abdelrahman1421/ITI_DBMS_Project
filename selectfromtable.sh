#!/bin/bash

typeset -i count=0

echo -n "

    =============(Select Menu)====================
    |                                            |
    |                                            |
    |  (1) Select all cloumns                    |
    |  (2) Select specific column                |
    |  (3) Select from table with condition      |
    |  (4) Back to Table Menu                    |
    |  (5) Back to Home Menu                     |
    |  (6) Exit                                  |
    |                                            |
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
                echo Select all cloumns

        elif [ $REPLY -eq 2 ]
        then
               
                echo Select specific column

        elif [ $REPLY -eq 3 ]
        then
                echo Select from table with condition

        elif [ $REPLY -eq 4 ]
        then
                echo Back to Table Menu 

        elif [ $REPLY -eq 5 ]
        then
                echo Back to Home Menu
        
        elif [ $REPLY -eq 6 ]  
        then
                exit              
                break
        else    
                echo -e "<< Please note that after entering number is not in the menu for three times it will be closed  >> \n"
                count=$count+1
                if [ $count -eq 3 ]
                then
                        echo "Sorry for that you entered wrong choice for three times"
                        exit
                        break
                else        
                        echo "Please select a number from the Menu" 
                fi
        fi


done

selectalltable () 
{

read -p "Enter the table name" tbale_name
cat $tableName 
if [[ $? != 0]]
then
        echo "Something error"
fi
# add select menu function here

}

selectcolumn () 
{

read -p "Enter the table name" tbale_name
echo -e "\n"
read -p "Enter the cloumn num" column_num
awk '{print "$column_num"}'

# add select menu function here

}