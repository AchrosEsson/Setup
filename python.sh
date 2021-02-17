#!/bin/bash

echo "installiere Python"

sleep 2

apt-get install -y python3-pip
apt-get install -f
apt-get install -y python3-venv
apt-get install -f

exit