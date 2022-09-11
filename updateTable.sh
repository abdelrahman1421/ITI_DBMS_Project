#!/bin/bash


function updateTable ()
{
  read -p "Enter the table name: " t_name
  cat $t_name 2>> /dev/null >> /dev/null 
  if [ $? -eq 1 ]
  then 
      echo -e "\nTable not found \n"
  else
  echo ""
  echo -e "             <<< The table column as following you enter the name of any one >>> \n"
  echo --------------------------------------------
    echo ""
        head -1 $t_name | column -t -s ":"
    echo ""
  echo --------------------------------------------
    echo ""
  echo -e "Enter column name: \c"
  read c_name
  c_num=`awk 'BEGIN{FS=":"}{if(NR==1){for(i=1;i<=NF;i++){if($i=="'$c_name'") print i}}}' $t_name 2>>/dev/null`
  if [[ $c_num == "" ]]
  then
    echo "Not Found"
 #tabel menu should placed here
  else
    echo -e "Enter the value to select row: \c"
    read val
    r_num=`awk 'BEGIN{FS=":"}{if ($'$c_num'=="'$val'") print $'$c_num'}' $t_name 2>>/dev/null`

      if [[ $r_num != "" ]]  
        then
            echo ""
            echo "This current table content"
            echo --------------------------------------------
            echo ""
            head -1 $t_name >> tem_log
            grep -w "$val" $t_name >> tem_log
            column -t -s ":" tem_log
            echo ""
            echo --------------------------------------------
            echo ""
        else
          echo ""
     fi
    if [[ $r_num == "" ]]
    then

      echo "Value Not Found"
 #tabel menu should placed here
    else
      echo -e "Enter which column name to update inside it: \c"
      read sel_column
      colu_num=`awk 'BEGIN{FS=":"}{if(NR==1){for(i=1;i<=NF;i++){if($i=="'$sel_column'") print i}}}' $t_name 2>> /dev/null`
      if [[ $colu_num == "" ]]
      then
        echo "Not Found"
 #tabel menu should placed here
      else
        
        echo -e "Enter new value to set: \c"
        read new_val
        NR=`awk 'BEGIN{FS=":"}{if ($'$c_num' == "'$val'") print NR}' $t_name 2>>/dev/null`
        old_val=`awk 'BEGIN{FS=":"}{if(NR=='$NR'){for(i=1;i<=NF;i++){if(i=='$colu_num') print $i}}}' $t_name 2>> /dev/null`
        sed -i ''$NR's/'$old_val'/'$new_val'/g' $t_name 2>>/dev/null
        echo ""
        echo -e "   <<< The row content before and after updating >>> \n"
        echo -e "<<< on th LEFT "OLD ONE" on the RIGHT "UPDATED VALUE">>> \n"
        echo ---------------------------------------------------------------
        echo ""
                head -1 $t_name >> tem_data
                grep -w "$val" $t_name >> tem_data
                column -t -s ":" tem_data >>dif_tem_data
                column -t -s ":" tem_log >>dif_tem_log
                pr -m -W 150 -t dif_tem_log dif_tem_data
        echo ""
        echo ----------------------------------------------------------------
        echo "Row Updated Successfully"
        rm -rf tem_data tem_log dif_tem_data dif_tem_log
 #tabel menu should placed here
      fi
    fi
  fi
  fi 
}

updateTable