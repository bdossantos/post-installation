#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get upgrade -y
apt-get install git-core sudo lsb-release wget -y

CODENAME=$(lsb_release -sc)

cd /tmp
wget -q "http://apt.puppetlabs.com/puppet-release-${CODENAME}.deb"
dpkg -i "puppet-release-${CODENAME}.deb"

apt-get update
apt-get install puppet-common puppet facter ruby-augeas sudo -y

wget https://github.com/bdossantos.keys
mkdir -p -m 0700 ~/.ssh
cat /tmp/bdossantos.keys > ~/.ssh/authorized_keys
