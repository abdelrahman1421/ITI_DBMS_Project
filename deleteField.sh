#!/bin/bash

function deleteField () 
{

  read -p "Enter the table name: " t_name
  cat $t_name 2>> /dev/null >> /dev/null
  if [ $? -eq 1 ]
  then  
      echo -e "\n Table not found \n"
  else
  echo ""
  echo -e "             <<< The table contains this data  >>> \n"
  echo --------------------------------------------------------------------------------------------------------
    echo ""
        column -t -s ":" $t_name
        
    echo ""
  echo --------------------------------------------------------------------------------------------------------
    echo ""
  echo -e "Enter column name: \c"
  read c_name
  echo ""
c_num=$(awk 'BEGIN{FS=":"}{if(NR==1){for(i=1;i<=NF;i++){if($i=="'$c_name'") print i}}}' $t_name)
  if [[ $c_num == "" ]]
  then
    echo "Not Found"
    #
    rm -rf t_name_temp
  else
    echo -e "\nEnter any value in row you entered before this step to delete this row: \c"
    read val
    r_num=`awk 'BEGIN{FS=":"}{if ($'$c_num'=="'$val'") print $'$c_num'}' $t_name 2>> /dev/null`
    if [[ $r_num == "" ]]
    then
      echo "Value Not Found"
      #
    else
      NR=`awk 'BEGIN{FS=":"}{if ($'$c_num'=="'$val'") print NR}' $t_name 2>> /dev/null `
      column -t -s ":" $t_name >> t_name_temp
      sed -i ''$NR'd' $t_name 2>> /dev/null
      column -t -s ":" $t_name >> t_name_temp1
      echo ""
      echo -e "             <<< The Tbale content before and after deleting >>> \n"
      echo -e "              <<< on th LEFT "OLD ONE" on the RIGHT "NEW ONE">>> \n"
      echo --------------------------------------------------------------------------------------------------------
                echo ""
                pr -m -t t_name_temp t_name_temp1
                rm -rf t_name_temp1 t_name_temp
                echo ""
      echo --------------------------------------------------------------------------------------------------------
      echo ""
      
      echo -e "Row Deleted Successfully \n"
 #
    fi
  fi

  fi 


}
deleteField