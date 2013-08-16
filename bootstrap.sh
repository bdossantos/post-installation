#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get upgrade -y
apt-get install git-core sudo lsb-release -y

CODENAME=$(lsb_release -sc)
PUPPET_VERSION='2.7.23'

pushd /tmp
    wget -q http://apt.puppetlabs.com/puppetlabs-release-$CODENAME.deb
    dpkg -i puppetlabs-release-$CODENAME.deb
    rm -f puppetlabs-release-$CODENAME.deb
    apt-get update
    apt-get install puppet-common=$PUPPET_VERSION-1puppetlabs1 -y
    apt-get install puppet=$PUPPET_VERSION-1puppetlabs1 -y
popd
