#!/bin/bash

#### Bash-Script zur installation von Docker ####

echo $'\n'
echo 'installiere Docker'
echo $'\n'
sleep 2


curl -fsSL https://get.docker.com -o get-docker.sh
(. ./get-docker.sh)
sudo apt update -y
apt-get install -f

exit