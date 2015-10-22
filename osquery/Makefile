VERSION=1.5.3
OSQUERY_PACKAGE=osquery-$(VERSION).deb

all:
	@echo "To install osquery, run 'make install'"

install: $(OSQUERY_PACKAGE)
	sudo dpkg -i $(OSQUERY_PACKAGE)
	sudo cp osquery.conf /etc/osquery/osquery.conf
	sudo osqueryctl start

osquery-$(VERSION).deb:
	wget https://osquery-packages.s3.amazonaws.com/trusty/$(OSQUERY_PACKAGE)

clean:
	sudo dpkg -r osquery
	rm $(OSQUERYT_PACKAGE)
