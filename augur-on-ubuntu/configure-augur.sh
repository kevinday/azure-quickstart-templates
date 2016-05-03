#!/bin/bash

# print commands and arguments as they are executed
set -x

echo "starting augur installation"
date

#############
# Parameters
#############

AZUREUSER=$1
LOCATION=$2
VMNAME=`hostname`
HOMEDIR="/home/$AZUREUSER"
ETHEREUM_HOST_RPC="http://${VMNAME}.${LOCATION}.cloudapp.azure.com:8545"
echo "User: $AZUREUSER"
echo "User home dir: $HOMEDIR"
echo "vmname: $VMNAME"

cd $HOMEDIR

#####################
# install tools
#####################
time sudo apt-get install -y build-essential
time sudo apt-get -y install git
time sudo apt-get -y install libssl-dev

####################
# Intsall Geth
####################
time sudo apt-get install -y software-properties-common
time sudo add-apt-repository -y ppa:ethereum/ethereum
time sudo add-apt-repository -y ppa:ethereum/ethereum-dev
time sudo apt-get update
time sudo apt-get install -y ethereum


sudo -u $AZUREUSER wget https://raw.githubusercontent.com/kevinday/azure-quickstart-templates/web/augur-on-ubuntu/geth.conf
sed -i "s/auguruser/$AZUREUSER/g" geth.conf

touch /var/log/geth.sys.log
chown $AZUREUSER /var/log/geth.sys.log

date
echo "completed augur install $$"