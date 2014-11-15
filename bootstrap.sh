#!/usr/bin/env bash


# Variabled
DEB=elasticsearch-1.4.0.deb

CONFIG_FILE=/etc/elasticsearch/elasticsearch.yml

PLUGIN_CMD=/usr/share/elasticsearch/bin/plugin

PLUGINS[0]=elasticsearch/elasticsearch-analysis-kuromoji/2.4.1
PLUGINS[1]=polyfractal/elasticsearch-inquisitor
PLUGINS[2]=mobz/elasticsearch-head
PLUGINS[3]=royrusso/elasticsearch-HQ
PLUGINS[4]=elasticsearch/marvel


# Prepare
apt-get update
apt-get install -y python-software-properties language-pack-ja
update-locale LANG=ja_JP.UTF-8


# Install Java
add-apt-repository ppa:webupd8team/java
apt-get update
echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections
apt-get install -y oracle-java7-installer


# Install Elasticsearch
wget https://download.elasticsearch.org/elasticsearch/elasticsearch/$DEB
dpkg -i $DEB


# Install Elasticsearch Plugins
for PLUGIN in ${PLUGINS[@]}
do
    $PLUGIN_CMD --install $PLUGIN
done


# Start Elasticsearch
/etc/init.d/elasticsearch restart


# Install Python　Modules
apt-get install -y python-setuptools
easy_install -UZ pip
pip install --upgrade pip
pip install elasticutils


# Install Test Data
python /vagrant/scripts/create_test_data.py
