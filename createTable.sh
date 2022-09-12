#!/bin/bash
shopt -s extglob


####################### Create table ########################


read -p "table name: " tablename

                case $tablename in

                    +([A-Za-z]))
                        
                            if [ -f ./$tablename ]
                            then                       
                                
                                echo "Error! this table is already exist."
                        
                            else
                               

                               
                                # take num.of fields from the user and ensure that is a number
                                read -p "Enter number of Fields: " num_fields
                                #typeset -i num_fields=$num_fields                    # if the user insert a string this line will make it = 0            
                                



                                
                                # check $num_fields is a special character or empty value or a string

                                while [[ "$num_fields" =~ ['!`@#$%^&*()_+'] ]]  ||  [[ -z "$num_fields" ]] || [[ $num_fields = +([A-Za-z]) ]]; 
                                do

                                    echo -e "Error! you must enter a number \n"
                                    read -p "Enter number of Fields: " num_fields  
                                    
                                done
                        



                                
 

                                primary_key="" 
                                num=1   # set a Counter                              
                                # Start point of the loop
                                while [ $num -le $num_fields ]
                                do

                                    # take field name from the user   
                                     read -p "Name of field no.$num: " field_name
                                                 
                                    while ! [[ $field_name = +([A-Za-z]) ]];
                                    do                   
                                        echo "invalid field type !!"
                                        read -p "Name of field no.$num: " field_name

                                    done

                                   # Select the field type
                                    echo -e "Type of field $field_name:"
                                   
                                    select type in "int" "str"
                                    do
                                    case $type in
                                        int ) field_type="int";break;;
                                        str ) field_type="str";break;;
                                        * ) echo "invalid answer" ;;
                                    esac
                                    done



                                    # make some variables to define metadata and set primary key with "" value                                     
                                      
                                      new_line="\n"
                                      seperator=":"                                                                           
                                      meta_data="field"$seperator"type"$seperator"key"

                                    
                                    # Check is there a primary key in the seperatorle or not
                                    while [ "$primary_key" == "" ]   # if primary key=""
                                    do
                                        echo -e "Do u want to make a Primary Key?"

                                        select answer in "yes" "no"
                                        do
                                            case $answer in

                                            yes ) primary_key="PKset";
                                                  meta_data=$new_line$field_name$seperator$field_type$seperator$primary_key;break;;
                                            
                                            no ) primary_key="no";
                                                 meta_data=$new_line$field_name$seperator$field_type$seperator$primary_key;break;;

                                            * ) echo "invalid answer" 
                                                    ;;
                                            esac
                                            
                                            
                                        done

                                                                        
                                    done
                                    

                                    if [ "$primary_key" == "no" ]
                                    then
                                            primary_key=""
                                    fi

                                    myarray[$num]=$field_name$seperator$field_type$seperator$primary_key


                                    if [ "$primary_key" == "PKset" ]  
                                    then
                                            primary_key="\t"                                    
                                              
                                    fi
                                            
                                            
                                                                    

                                    ((num++))

                                done
                                # End point of the loop


                                                           
                                # insert 

                                touch $tablename
                                touch meta_$tablename

                                echo -e "field"$seperator"type"$seperator"key" >> meta_$tablename
                                
                                for i in ${myarray[*]}
                                do
                                    echo -e "$i" >> meta_$tablename                                
                                    
                                done
                               

                                awk '(NR>1)' meta_$tablename | cut -d ":" -f 1 | awk  '{ printf "%s:",$1 }' > $tablename 
                                echo "" >> $tablename
                                #awk '(NR>1)' meta_$tablename | cut -d ":" -f 2 | awk '{printf "%s:", $1}' >> $tablename
                                #echo "" >> $tablename
                                #awk '(NR>1)' meta_$tablename | cut -d ":" -f 3 | awk '{printf "%s:", $1}' >> $tablename
                                #echo "" >> $tablename


                                if [ $? -eq 0 ]
                                then
                                        echo "table is Created Successfully"
                                        sleep 1
                                        clear
                                            
                                else
                                        echo "error! Creating table $tableName"
                                fi


                                


                            fi
                            ;;      
        
                    *)

                            echo "invalid table name: "
                            ;;      
        
                esac 

    