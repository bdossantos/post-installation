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
wget https://github.com/bdossantos.keys
mkdir -p -m 0700 ~/.ssh
cat /tmp/bdossantos.keys > ~/.ssh/authorized_keys

apt-get update
apt-get install facter sudo -y
