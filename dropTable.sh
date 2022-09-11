#!/bin/bash

dir=`pwd`

echo $dir
sleep 3
read -p "Please enter the tbale name you want to Drop: " drop_table_name



    if [ -f $dir/$drop_table_name ]
  	then 

        while true
        do

                            echo -n -e "
             ###############(Drop Table)###############
           ||                                          ||
           ||                                          ||
           || (1) Cofirm dropping '$drop_table_name'   
           || (2) Cancel                               ||
           ||                                          ||
           ||                                          ||
             ##########################################  \n\n"

            read -p "Please confirm that action or cancel droping: " 
                
            typeset -i rep=$REPLY

            if [ $rep -eq 1 ] 
            then
                    rm -rf $dir/$drop_table_name
                    echo "----------------------------------------------"
                    echo -e "Table was successfully dropped."
                    echo "----------------------------------------------"

            elif [ $REPLY -eq 2 ]
            then
                         echo "-----------------------------------------"
                         echo -e "Drop Table was canceled."
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
            echo -e "Table not found."
            echo "--------------------------------"

            

fi
sleep 2
cd ../..
clear
source ./main.sh




   
