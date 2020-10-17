FROM debezium/connect:1.2.0.Final
COPY docker-maven-download /usr/local/bin/docker-maven-download
RUN docker-maven-download central org/mongodb mongodb-driver-core 3.12.1 && \
    docker-maven-download central com/fasterxml/jackson/core jackson-databind 2.10.2
RUN mkdir /kafka/connect/mongodb
COPY mongodb/* /kafka/connect/mongodb/
RUN mkdir /kafka/connect/googlesheets
COPY googlesheets/* /kafka/connect/googlesheets/
RUN mkdir /kafka/connect/http
COPY http/* /kafka/connect/http/
RUN mkdir /kafka/connect/elasticsearch
COPY elasticsearch/* /kafka/connect/elasticsearch/
HEALTHCHECK --start-period=10s --retries=99 CMD curl -f http://${HOSTNAME}:8083/connectors || exit 1
