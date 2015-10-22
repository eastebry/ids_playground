#!/bin/bash

# install bro's dependencies
echo "[+] Installing bro dependencies"
sudo apt-get install cmake make gcc g++ flex bison libpcap-dev libssl-dev python-dev swig zlib1g-dev

# install bro
if [ ! -d /usr/local/bro ]; then
    echo "[+] Installing bro"
    wget https://www.bro.org/downloads/release/bro-2.4.1.tar.gz
    tar -xzvf bro-2.4.1.tar.gz
    cd bro-2.4.1/ && ./configure && make && sudo make install
else
    echo "[+] Bro already installed"
fi

echo     
echo "Bro is installed. You should add /usr/local/bin/bro to your PATH"
echo "You should add /usr/local/bin/bro to your sudo path"
