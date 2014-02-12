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
# -*- mode: ruby -*-
# vi: set ft=ruby :

hosts = {
  "zookeeper" => "192.168.60.5",
  "broker1" => "192.168.60.10"
}

# TODO(ksweeney): RAM requirements are not empirical and can probably be significantly lowered.

Vagrant.configure("2") do |config|
  config.hostmanager.manage_host = true
  config.hostmanager.enabled = true
  
  config.vm.box = "precise64"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  
  hosts.each do |name, ip|
    config.vm.define name do |machine|
      machine.vm.hostname = "%s.kafka.example.org" % name
      machine.vm.network :private_network, ip: ip
      machine.vm.provider "virtualbox" do |v|
          v.name = name
          v.customize ["modifyvm", :id, "--memory", 512]
      end
      machine.vm.provision "ansible" do |ansible|
        ansible.inventory_path = "hosts"
        ansible.extra_vars = {kafka_id: "%s" % name.gsub(/[a-zA-Z]*/, '')}
        ansible.playbook = "provision/%s.yml" % name.gsub(/[0-9]*/, '')
        #ansible.verbose = "vvvv"
        ansible.sudo = true
      end
    end
  end
end
