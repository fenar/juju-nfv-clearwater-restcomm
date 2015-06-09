#!/bin/bash

#Install juju-deployer package
#sudo apt-get install -y juju-deployer

#Deploy the bundle
#TODO: soft link to bundle to stable and bleeding edge charm revisions

set -e

[ -d clearwater-juju/charms ] || (echo "please follow instruction in README"; exit 2)
export JUJU_REPOSITORY=$PWD/clearwater-juju/charms 

juju-deployer -c bundle-nfv-demo.yaml -c bundle-config.yaml
