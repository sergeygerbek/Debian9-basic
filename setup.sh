#!/bin/bash
#
#
#<UDF name="SUUSER" Label="Sudo user username?" example="username" />
#<UDF name="SUPASSWORD" Label="Sudo user password?" example="strongPassword" />
#<UDF name="SUPUBKEY" Label="SSH pubkey (for root and sudo user)?" example="ssh-rsa ..." />

#UPDATE & UPGRADE System
export DEBIAN_FRONTEND=noninteractive
apt-get -o Acquire::ForceIPv4=true update
apt-get -o Acquire::ForceIPv4=true -o Dpkg::Options::='--force-confdef' -o Dpkg::Options::='--force-confold' upgrade -y

#ADD USER & SSH PubKey
adduser $SUUSER --disabled-password --gecos "" && echo "$SUUSER:$SUPASSWORD" | chpasswd
adduser $SUUSER sudo
mkdir -p /root/.ssh && echo "$SUPUBKEY" >> /root/.ssh/authorized_keys
mkdir -p /home/$SUUSER/.ssh && echo "$SUPUBKEY" >> /home/$SUUSER/.ssh/authorized_keys
chmod -R 700 /root/.ssh
chmod -R 700 /home/${SUUSER}/.ssh && chown -R ${SUUSER}:${SUUSER} /home/${SUUSER}/.ssh
