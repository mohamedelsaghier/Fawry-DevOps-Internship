#!/bin/bash

mkdir /home/mohamed/fawry_tasks/scrum-board/
cd  /home/mohamed/fawry_tasks/scrum-board/
git clone https://board:V1SFGuH8DTQBdXUa2yru@gitlab.com/mohamedelsaghier/scrum-board-project.git 
cd scrum-board-project
git checkout master
git rev-list HEAD > check_master.txt 
remote_master_sha=$(git ls-remote https://board:V1SFGuH8DTQBdXUa2yru@gitlab.com/mohamedelsaghier/scrum-board-project.git HEAD | awk '{print $1}')

echo "Commit ID of Master: $remote_master_sha"
#cat check_master.txt
if grep -Fxq "$remote_master_sha"  ./check_master.txt
then
    echo "Master Merged Successfully" 
    exit 0
else
    echo "Please merge master before push to your branch" 
    exit 1 
fi