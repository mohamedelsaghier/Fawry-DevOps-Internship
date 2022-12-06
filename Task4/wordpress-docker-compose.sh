#!/bin/bash

function detect_os() {
	if [[ -f /etc/os-release ]]
	then
	    # On Linux systems	
	    source /etc/os-release	
	    echo Linux ditribution is $ID
        else
	    # On systems other than Linux (e.g. Mac or FreeBSD)	
            uname
        fi
}

detect_os

case $ID in
    centos | rhel)
        if command -v docker > /dev/null 2>&1; then
          echo "docker is already installed." ; docker -v
        else
          sudo yum update ; sudo yum install docker.io
        fi
        ;;
    ubuntu | debian)
        if command -v docker > /dev/null; then
          echo "docker is is already installed." ; docker -v
        else
          sudo apt update ; sudo apt install docker.io
        fi	    
        ;;
esac

function install_docker_compose() {
    if command -v docker-compose >/dev/null; then
      echo "docker-compose is already installed." ; docker-compose -v
    else
      sudo apt update ; sudo apt install docker-compose
    fi
}
install_docker_compose

function install_wordpress_dockercompose(){
  mkdir /home/mohamed/fawry_tasks/wordpress-docker-compose/
  cd /home/mohamed/fawry_tasks/wordpress-docker-compose/
  git clone https://github.com/kassambara/wordpress-docker-compose
  cd wordpress-docker-compose
  docker-compose up -d --build
}
install_wordpress_dockercompose
# Visit your site at http://localhost and your database via phpMyAdmin at http://localhost:8080.
