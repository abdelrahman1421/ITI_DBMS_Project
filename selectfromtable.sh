#!/bin/bash

typeset -i count=0
read -p "Enter the table name: " t_name
echo -e "\n"

 cat $t_name 2> /dev/null 1> /dev/null 

function selecetFromTable () {
if [ $? == 0 ]
    then 
    while true
    do
         
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
        read -p "Please select a choice: "
        typeset -i REPLY=$REPLY

        if [ $REPLY -eq 1 ] 
        then
                cat $t_name

        elif [ $REPLY -eq 2 ]
        then
               
                read -p "ENter the column name: " c_name
                tnum=`head -3 abdo | tr -s ' ' '\n' | nl -nln |  grep "$c_name" | cut -f1`
                awk -v var=$tnum '{ print $var}' $t_name

        elif [ $REPLY -eq 3 ]
        then
                echo Select from table with condition

        elif [ $REPLY -eq 4 ]
        then
                echo Back to Table Menu 

        elif [ $REPLY -eq 5 ]
        then
                cd ../..
                source /home/abdo/project/connectDB.sh
                exit
                break
        
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
    else
        echo this table not found.

        exit
        break
    fi
} 

selecetFromTable