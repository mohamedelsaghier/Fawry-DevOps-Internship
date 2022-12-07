#! /bin/bash

source ./helper_functions.sh

#call welcome_message function
welcome_message

#get process name from the user
print_colored "bwhite" "Please enter the name of the process you want to kill:"
read process_name

#call kill_process function 
kill_process $process_name
