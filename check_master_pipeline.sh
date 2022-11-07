#!/bin/bash

rm -rf ./$CI_COMMIT_SHORT_SHA
mkdir ./$CI_COMMIT_SHORT_SHA
cd  ./$CI_COMMIT_SHORT_SHA
git clone https://board:V1SFGuH8DTQBdXUa2yru@gitlab.com/mohamedelsaghier/scrum-board-project.git
cd $CI_PROJECT_NAME
git checkout $CI_COMMIT_REF_NAME
git rev-list HEAD > check_master.txt 
remote_master_sha=$(git ls-remote https://board:V1SFGuH8DTQBdXUa2yru@gitlab.com/mohamedelsaghier/scrum-board-project.git HEAD | awk '{print $1}')


if grep -Fxq "$remote_master_sha"  ./check_master.txt
then
    echo "Master Merged Successfully"
    exit 0
else
    echo "Please merger master before push to your branch"
    exit 1 
fi