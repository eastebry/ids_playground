#!/bin/bash
set -e
echo "Installing and starting the IDS playground."
echo "Unless you really know what you are doing, this script should probably only be run in a VM"
echo "Sleeping for 10 seconds to allow you to Ctl-c this script"
sleep 10
echo "Installing"

# Install docker
if [[ $(which docker) == "" ]]; then
    # TODO docker changed the way it was supposed to install
    # make sure to update that here
    curl -sSL https://get.docker.com/ | sh
    # Add the vagant user to the docker group
    sudo usermod -aG docker vagrant
fi

# Install pip and docker-compose
if [[ $(which docker-compose) == "" ]]; then
    sudo apt-get update
    sudo apt-get install -y python-setuptools
    sudo easy_install pip
    sudo pip install docker-compose
fi

# Start up our ELK stack
cd /vagrant/docker-elk && ./run.sh

# Install osquery
cd /vagrant/osquery && make install

# Install suricata
cd /vagrant/suricata && make install
