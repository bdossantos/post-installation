#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get upgrade -y
apt-get install git-core sudo lsb-release wget -y

CODENAME=$(lsb_release -sc)
PUPPET_VERSION='3.6.2-1puppetlabs1'
FACTER_VERSION='2.1.0-1puppetlabs1'

cd /tmp
wget -q http://apt.puppetlabs.com/puppetlabs-release-$CODENAME.deb
dpkg -i puppetlabs-release-$CODENAME.deb
rm -f puppetlabs-release-$CODENAME.deb
apt-get update
apt-get install puppet-common=$PUPPET_VERSION puppet=$PUPPET_VERSION \
                facter=$FACTER_VERSION libaugeas-ruby -y

wget https://github.com/bdossantos.keys
mkdir -m 0700 ~/.ssh
cat /tmp/bdossantos.keys > ~/.ssh/authorized_keys
