#!/bin/bash
LOGSTASH_CONF_DIR="/logstash_configs"

if [[ $1 == "bro" ]]; then
    HOST_LOGS_DIR="/usr/local/bin/bro/logs"
    DOCKER_LOGS_DIR="/logs/bro"
    LOGSTASH_CONFIG_PREFIX='bro'

elif [[ $1 == "suricata" ]]; then
    HOST_LOGS_DIR="/var/log/suricata/"
    DOCKER_LOGS_DIR="/logs/suricata"
    LOGSTASH_CONFIG_PREFIX="suricata"

elif [[ $1 == "osquery" ]]; then
    HOST_LOGS_DIR="/var/log/osquery/"
    DOCKER_LOGS_DIR="/logs/osquery"
    LOGSTASH_CONFIG_PREFIX="osquery"

elif [[ $1 == "apache" ]]; then
    HOST_LOGS_DIR="$(pwd)/data/access.log"
    DOCKER_LOGS_DIR="/logs/apache/"
    LOGSTASH_CONFIG_PREFIX="apache_access"

else
    echo "Usage ./run.sh [bro|suricata|osquery|apache]"
    exit 1
fi

# Start the logstash docker container
docker run --rm --name $LOGSTASH_CONFIG_PREFIX"_logstash" \
    -v $HOST_LOGS_DIR:$DOCKER_LOGS_DIR:ro \
    --link elasticsearch:elasticsearch \
    logstash \
    logstash -f $LOGSTASH_CONF_DIR"/"$LOGSTASH_CONFIG_PREFIX"_logstash.conf"
