# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
# 
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#!/bin/bash
apt-get -y update
apt-get install -y software-properties-common python-software-properties
add-apt-repository -y ppa:webupd8team/java
apt-get -y update
/bin/echo debconf shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
apt-get -y install oracle-java7-installer oracle-java7-set-default

chmod a+rw /opt
cd /opt
ln -s /vagrant/kafka kafka
cd kafka
bin/zookeeper-server-start.sh config/zookeeper.properties 1>> /tmp/zk.log 2>> /tmp/zk.log &
