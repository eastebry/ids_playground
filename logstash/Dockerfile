FROM java:openjdk-8-jre

RUN apt-get update
RUN apt-get install -y wget

# Install logstash
WORKDIR /opt
RUN wget https://download.elastic.co/logstash/logstash/logstash-1.5.4.tar.gz
RUN tar -xzvf logstash-1.5.4.tar.gz
RUN ln -s logstash-1.5.4 logstash
ENV PATH /opt/logstash/bin:$PATH

# Install logstash plugins
RUN /opt/logstash/bin/plugin install logstash-filter-translate

ADD logstash_configs/ /logstash_configs
WORKDIR /opt/logstash/bin/

CMD ["/opt/logstash/bin/logstash"]
