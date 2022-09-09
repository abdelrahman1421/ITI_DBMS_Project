#!/bin/bash
shopt -s extglob


####################### Insert into table ########################

  read -p "Enter table name: " table_name

  if [ -f $table_name ]
  then

        num_fields=`awk -F ":" '{if(NR==1) print NF}' $table_name`

        
        i=2
        while [ $i -le $num_fields ]
        do

            field_name=$(awk 'BEGIN{FS=":"}{ if(NR=='$i') print $1}' meta_$table_name)
            field_type=$(awk 'BEGIN{FS=":"}{ if(NR=='$i') print $2}' meta_$table_name)
            field_pk=$(awk 'BEGIN{FS=":"}{ if(NR=='$i') print $3}' meta_$table_name)

        # echo -e "$colName ($colType) = \c"
        # read data

                read -p "Enter field ( $field_name ): " value

            ((i++))
        
        done



    fi





















