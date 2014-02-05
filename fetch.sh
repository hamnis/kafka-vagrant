#!/bin/bash
VERSION=0.8.0
BASE=kafka_2.8.0-${VERSION}

wget http://apache.komsys.org/kafka/0.8.0/${BASE}.tar.gz -O /tmp/${BASE}.tar.gz
tar zxfv /tmp/${BASE}.tar.gz 
ln -sf ${BASE} kafka
