#!/bin/bash

APP_NAME=$1
REPO_URL=$2
HTTPS_REPO_URL="https://$(echo  $REPO_URL | sed 's~http[s]*://~~g')"
echo $HTTPS_REPO_URL
docker system prune -f 
rm -rf $APP_NAME
mkdir $APP_NAME
cd  ./$APP_NAME
git clone $HTTPS_REPO_URL 
cd ./ecommerceBIS/
git checkout main
export uid=1000
export user=oday
docker build . -t $APP_NAME:$(date +"%d-%m-%y")
docker images
docker login registry.gitlab.com -u squadx -p Q_rKzt2Qmxazm82Ws3Em
docker push $APP_NAME:$(date +"%d-%m-%y")
rm -rf $APP_NAME
docker system prune -f
