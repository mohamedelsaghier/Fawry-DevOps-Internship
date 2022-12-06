#!/bin/bash

function detect_os() {
	if [[ -f /etc/os-release ]]
	then
	    # On Linux systems	
	    source /etc/os-release	
	    echo $ID
        else
	    # On systems other than Linux (e.g. Mac or FreeBSD)	
            uname
        fi
}

echo "Linux ditribution is $(detect_os)"

case $(detect_os) in
    centos | rhel)
        if command -v docker > /dev/null 2>&1; then
          echo docker is available ; docker -v
        else
          sudo yum update ; sudo yum install docker.io
        fi
        ;;
    ubuntu | debian)
        if command -v docker > /dev/null 2>&1; then
          echo docker is available ; docker -v
        else
          sudo apt update ; sudo apt install docker.io
        fi	    
        ;;
esac
