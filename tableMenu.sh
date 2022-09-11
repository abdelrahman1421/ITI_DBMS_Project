#!/bash/bin
           

                                echo -n "
                         ################(Table Menu)##################
                        ||                                            ||
                        ||                                            ||
                        || (1) Create Table                           ||
                        || (2) List Table                             ||
                        || (3) Drop Table                             ||
                        || (4) Insert To Table                        ||
                        || (5) Select From Table                      ||
                        || (6) Delete From Table                      ||
                        || (7) Update Table                           ||
                        || (8) Back To Main Menu                      ||
                        ||                                            ||
                        ||                                            ||
                         #############################################
                        "
                        echo ""
                                
                                read -p "($database)--> Please select a choice: "

                                case $REPLY in

                                        [1-8])                                                 
                                                                                               
                                                                
                                                               

                                                                if [ $REPLY -eq 1 ] 
                                                                then
                                                                        # Creating a new table
                                                                
                                                                        source ../../createTable.sh
                                                                        sleep 2
                                                                        source ../../tableMenu.sh                                                                      
                                                                        
                                                                elif [ $REPLY -eq 2 ]
                                                                then
                                                                        # List all tables
                                                                        
                                                                        ls ./
                                                                        sleep 2
                                                                        source ../../tableMenu.sh
                                                                        
                                                                        
                                                                elif [ $REPLY -eq 3 ]
                                                                then
                                                                        # Drop table
                                                                        
                                                                        source  ../../dropTable.sh
                                                                        sleep 2
                                                                        source ../../tableMenu.sh
                                                                        

                                                                elif [ $REPLY -eq 4 ]
                                                                then
                                                                # Insert to table
                                                                
                                                                        source ../../insertIntoTable.sh
                                                                        sleep 2
                                                                        source ../../tableMenu.sh

                                                                elif [ $REPLY -eq 5 ]
                                                                then
                                                                        # Select from table
                                                                        
                                                                        source ../../selectfromtable.sh
                                                                        sleep 2
                                                                        source ../../tableMenu.sh

                                                                elif [ $REPLY -eq 6 ]
                                                                then
                                                                        # Delete from table
                                                                        
                                                                        source ../../deleteField.sh
                                                                        sleep 2
                                                                        source ../../tableMenu.sh
                                                
                                                
                                                                elif [ $REPLY -eq 7 ]
                                                                then
                                                                        # update table
                                                                        
                                                                        source ../../updateTable.sh
                                                                        sleep 2
                                                                        source ../../tableMenu.sh



                                                                elif [ $REPLY -eq 8 ]
                                                                then

                                                                        
                                                                        source ../../main.sh                          
                                                                        
                                                                                                                        
                                                                fi

                                                        


                                                                ;;


                                        *)

                                                echo "Please select a number from the Menu"

                                esac


