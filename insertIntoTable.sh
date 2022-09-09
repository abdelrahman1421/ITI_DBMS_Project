#!/bin/bash
shopt -s extglob

new_line="\n"
seperator=":"
 
####################### Insert into table ########################

        read -p "Enter table name: " table_name

        if [ -f $table_name ]
        then


                # Count number of fields of the table
                num_fields=`awk -F ":" '{if(NR==1) print NF}' $table_name`   

                
                # to get meta data from meta_table which we will use it in validation
               

                i=2
                while [ $i -le $num_fields ]
                do

                        field_name=$(awk 'BEGIN{FS=":"}{ if(NR=='$i') print $1}' meta_$table_name)
                        field_type=$(awk 'BEGIN{FS=":"}{ if(NR=='$i') print $2}' meta_$table_name)
                        field_pk=$(awk 'BEGIN{FS=":"}{ if(NR=='$i') print $3}' meta_$table_name)



                        read -p "Enter field ( $field_name ): " value



                        # Validate the (Value) entered by the user:


                        # (1) the type of the field is "integer"

                        if [ "$field_type" = "int" ]
                        then
                                
                                
                            while ! [[ "$value" =~ ^[1-9]*[1-9]+$|^[1-9]+[0-9]*$ && -n "$value" ]]
                            do

                                echo -e "error! invalid Data type  xx"
                                read -p "Enter field ( $field_name ): " value
                                

                            done


                        # (2) the type of the field is "string"

                        elif [ "$field_type" = "str" ]
                        then

                                
                            while ! [[ "$value" =~ ^[a-zA-Z] && -n "$value" ]]
                            do

                                echo -e "error! invalid Data type  xx"
                                read -p "Enter field ( $field_name ): " value
                                

                            done


                        fi



                        # (3) Validate Primary key
                        if [ "$field_pk" = "PKset" ]
                        then
                        

                            result=$(for i in `awk -F: '{if(NR > 3) print $1}' $table_name`;do echo $i;done)

                            for x in `echo $result`
                            do

                                if [ "$x" = "$value" ]
                                then

                                        echo -e "error! Primary key Must be Unique"
                                        read -p "Enter field ( $field_name ): " value

                                fi

                            done


                        fi
                       



                        # Insert new row into the table
                        if [ $i == $num_fields ]
                        then

                            new_row=$value$new_line

                        else

                            new_row=$value$seperator
                        fi

                        echo -e $new_row"\c" >> $table_name




                    ((i++))
                
                done

                if [ $? -eq 0 ]
                then
                        echo "Done! a new row is inserted into $table_name successfully"
                else
                        echo "error! faild to insert Data into: $table_name"
                fi

        else

            echo "error! table name doesn't exist"
            source ../../insertIntoTable.sh

        fi





















