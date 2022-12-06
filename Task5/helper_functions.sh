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
    print_colored "blue" "**             Check Nginix Server sevice                 **"
    print_colored "blue" "**                                                        **"
    print_colored "blue" "**          Created by: Eng. Mohamed Elsaghier            **"
    print_colored "blue" "************************************************************"
    print_colored "white" ""

}
#######################################
# Check the status of web service with curl.
# Arguments:
#   url
# Usage:      check_status url
#######################################
check_status(){
    FAIL_CODE=7
    curl -sf "${1}" > /dev/null

    if [ ! $? = ${FAIL_CODE} ]
    then
        print_colored "green" "${1} is online"
        return 0
    else
        print_colored  "red" "${1} is down"
        return 1
    fi
}
