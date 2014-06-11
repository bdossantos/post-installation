#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get upgrade -y
apt-get install git-core sudo lsb-release -y

CODENAME=$(lsb_release -sc)
PUPPET_VERSION='3.6.1-1puppetlabs1'

cd /tmp
wget -q http://apt.puppetlabs.com/puppetlabs-release-$CODENAME.deb
dpkg -i puppetlabs-release-$CODENAME.deb
rm -f puppetlabs-release-$CODENAME.deb
apt-get update
apt-get install puppet-common=$PUPPET_VERSION puppet=$PUPPET_VERSION \
                libaugeas-ruby -y
