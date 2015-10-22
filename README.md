# IDS Playground
This repo consists of a Vagrantfile, and tools that help you get started exploring IDS, and analyzing the data with Kibana.

## Tools that are included here:
    * A standalone ElasticSearch node
    * Logstash, with various configuration files
    * Suricata
    * Osquery

## Tools that are included, but are not well supported at the moment
    * Bro

## A note about the infrastructure
All the tools here are deployed as docker containers in the VM. This project does not require an understanding of docker, though. All of the docker-related commands required are included in the run scripts

## Prerequisties
The only prerequisite is Vagrant. You can download that here: https://www.vagrantup.com/

## Getting started

### Set up the VM
To get everything up and running.
```
# Start the VM
vagrant up
# SSH into the VM
vagrant ssh
# Run the bootstrap script
cd /vagrant/ && ./bootstrap.sh
```
This will install all the required tools, and start the IDS's.

### Send data to ElasticSearch
To send data to Elasticsearch, you will need to start the logstash process for whatever tool you are using.

To send the suricata data to ES:
```
cd /vagrant/logstash
# Make the docker containers
make
# start the suricata docker container
./run suricata
```
