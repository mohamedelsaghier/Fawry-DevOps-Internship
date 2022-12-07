#! /bin/bash

#######################################
# Print Colored Text to screen.
# Arguments:
#   COLOR,Text    
# Usage:      print_colored "color" "text" 
#######################################
function print_colored() {
   case $1 in
     "green") COLOR="\033[0;32m" ;;
     "red") COLOR="\033[0;31m" ;;
     "white") COLOR="\033[0;37m" ;;
     "bwhite") COLOR="\033[1;37m" ;;
     "blue") COLOR="\033[44m" ;;
     "purple") COLOR="\033[0;35m" ;;
      "*") COLOR="\033[0m"
    esac
   echo -e "${COLOR} $2 ${NC}" 
}
#######################################
# Print welcome messages to screen.
# Arguments:
#   Non
# Usage:      welcome_message
#######################################
function welcome_message() {
    clear
    print_colored "blue" "************************************************************"
    print_colored "blue" "**                 Bash Shell Script                      **"
    print_colored "blue" "**           Kill Process using process name              **"
    print_colored "blue" "**                                                        **"
    print_colored "blue" "**          Created by: Eng. Mohamed Elsaghier            **"
    print_colored "blue" "************************************************************"
    print_colored "white" ""

}

function kill_process(){
    process_name=$1
    ps -Af | grep "$process_name" | grep -v grep | awk '{print$2}' >process_id.txt
    if [ -s process_id.txt ]
    then 
        for pid in $(cat process_id.txt)
        do
            print_colored "purple" "${process_name} PID is : ${pid}"
            print_colored "green" "killing the proess..."
            echo $pid
            sudo kill -9 $pid
        done
        print_colored "green" "The process killed successfully."
    else
        print_colored "red" "${process_name} is not running or its name is wrong."
    fi
    # process_id=$(ps -Af | grep "$process_name" | grep -v grep | awk '{print$2}')
    # if [ -z "$process_id" ]
    # then
    #     print_colored "red" "${process_name} is not running or its name is wrong."
    # else
    #     print_colored "purple" "${process_name} PID is : ${process_id}"
    #     print_colored "green" "killing the proess..."
    #     sudo kill -15 $process_id
    #     print_colored "green" "The process killed successfully."
    # fi
}
