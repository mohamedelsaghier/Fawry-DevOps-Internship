#! /bin/bash
source ./helper_functions.sh

#call welcome_message function
welcome_message

#check if the Nginx up & running, if not running run docker-compose up
check_status http://localhost:80
is_running=$?
case $is_running in
    0)  ;;
    1) print_colored "green" "Starting installation with docker-compose ..."
       print_colored "white" ""
       sudo docker-compose up -d
       check_status http://localhost:80 ;;
esac
