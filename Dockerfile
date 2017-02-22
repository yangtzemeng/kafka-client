FROM ubuntu:16.04

ENV DEBIAN_FRONTEND noninteractive
ENV SCALA_VERSION 2.11
ENV KAFKA_VERSION 0.10.1.0
ENV KAFKA_HOME /opt/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION"
ENV PATH "$PATH:$KAFKA_HOME/bin"


# Install Kafka and other needed things
# http://mirror.netinch.com/pub/apache/kafka/0.10.1.1/kafka_2.10-0.10.1.1.tgz
RUN apt-get update && \
    apt-get install -y wget supervisor dnsutils openjdk-8-jre && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean && \
    wget -q http://mirror.netinch.com/pub/apache/kafka/"$KAFKA_VERSION"/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION".tgz -O /tmp/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION".tgz && \
    tar xfz /tmp/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION".tgz -C /opt && \
    rm /tmp/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION".tgz && \
    rm $KAFKA_HOME/config/server.properties

VOLUME /tmp/kafka-logs

CMD ["bash"]
