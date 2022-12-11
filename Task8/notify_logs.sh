#! /bin/bash
source ./helper_functions.sh
welcome_message

print_colored "green" "when sudo used this script pass the date and time to sudo_access.txt."

while true
do
    (tail -f -n0 /var/log/auth.log & ) | grep -q "opened"
    echo $(date +"%d-%m-%y"" %T") >>sudo_access.txt
done
# watch '(tail -f -n0 /var/log/auth.log & ) | grep -q "opened"'
# echo $(date +"%d-%m-%y"" %T") >>sudo_access.txt
