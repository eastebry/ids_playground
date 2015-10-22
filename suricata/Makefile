all:
	@echo "To install suricata, run 'make install'"

install:
	sudo add-apt-repository ppa:oisf/suricata-stable
	sudo apt-get update
	sudo apt-get install -y suricata
	sudo cp suricata.yaml /etc/suricata/suricata.yaml
	sudo service suricata restart

clean:
	sudo apt-get purge suricata
