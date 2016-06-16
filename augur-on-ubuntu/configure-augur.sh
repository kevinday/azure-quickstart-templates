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
