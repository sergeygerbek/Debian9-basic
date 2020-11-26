#!/bin/bash

export DEBIAN_FRONTEND=noninteractive
apt-get -o Acquire::ForceIPv4=true update
apt-get -o Acquire::ForceIPv4=true -o Dpkg::Options::='--force-confdef' -o Dpkg::Options::='--force-confold' upgrade -y
