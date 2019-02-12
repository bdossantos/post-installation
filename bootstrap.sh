#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

export DEBIAN_FRONTEND=noninteractive

cd /tmp
wget https://github.com/bdossantos.keys
mkdir -p -m 0700 ~/.ssh
cat /tmp/bdossantos.keys > ~/.ssh/authorized_keys

apt-get update
apt-get -y upgrade
apt-get -y install git-core sudo lsb-release wget
apt-get -y purge noderig beamium ovh-rtm-metrics-toolkit ovh-rtm-binaries
apt-get -y autoremove
