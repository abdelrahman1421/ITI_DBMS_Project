#!/bin/bash

####################################

function condition {
  echo -e "Select all columns that matches the enterd operator \n"
  echo -e "Enter required Column name: \c"
  read c_name
  c_id=` awk 'BEGIN{FS=":"}{if(NR==1){for(i=1;i<=NF;i++){if($i=="'$c_name'") print i}}}' $t_name `
  if [[ $c_id == "" ]]
  then
    echo "Not Found"
    selecetFromTable
  else
  
    echo -e "You can chose from this supported operators: [ ==, !=, >, <, >=, <= ] \n Select one: \c"
    read operat
    
    if [[ $operat == "==" ]] || [[ $operat == "!=" ]] || [[ $operat == ">" ]] || [[ $operat == "<" ]] || [[ $operat == ">=" ]] || [[ $operat == "<=" ]]
    then
      echo -e "\nEnter required VALUE: \c"
      read val
      
      res=`awk 'BEGIN{FS=":"}{if ( $'$c_id$operat$val' )  print $0 }' $t_name 2>> /dev/null | column -t -s ':'`
      if [[ $res == "" ]]
      then
        echo "Value Not Found"
        selecetFromTable
      else
        awk 'BEGIN{FS=":"}{if ($'$c_id$operat$val') print $0}' $t_name | column -t -s ':'
        selecetFromTable
      fi
    else
      echo "Unsupported Operator\n"
      selecetFromTable
    fi
  fi
}

######################################
typeset -i count=0
read -p "Enter the table name: " t_name

 cat $t_name 2> /dev/null 1> /dev/null 

function selecetFromTable () {
if [ $? == 0 ]
    then

while true
do
         
echo -n "

     ###############(Select Menu)################
    ||                                           ||
    ||                                           ||
    ||  (1) Select all cloumns                   ||
    ||  (2) Select specific column               ||
    ||  (3) Select from table with condition     ||
    ||  (4) Back to Table Menu                   ||
    ||  (5) Back to Main Menu                    ||
    ||  (6) Exit                                 ||
    ||                                           ||
    ||                                           ||
     ############################################
"
echo ""
        read -p "Please select a choice: "
        typeset -i REPLY=$REPLY

        if [ $REPLY -eq 1 ] 
        then
                column -t -s ': ' $t_name

        elif [ $REPLY -eq 2 ]
        then
                
                read -p "ENter the column name: " c_name
                c_num=`awk -F: -v col="$c_name" 'NR==1{for (i=1; i<=NF; i++) if ($i==col) {print i;exit}}' $t_name`
                awk -F: -v val="$c_num" '{ print $val }' $t_name | column -t -s ':'
                sleep 3


        elif [ $REPLY -eq 3 ]
        then
                condition
                
        elif [ $REPLY -eq 4 ]
        then
                
                clear
                source ../../tableMenu.sh

        elif [ $REPLY -eq 5 ]
        then
                cd ../..
                clear
                source ./main.sh
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


