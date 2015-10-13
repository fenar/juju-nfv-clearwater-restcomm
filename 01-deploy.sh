#!/bin/bash

#Install juju-deployer package
#sudo apt-get install -y juju-deployer

#Deploy the bundle
#TODO: soft link to bundle to stable and bleeding edge charm revisions

set -e

[ -d clearwater-juju/charms ] || (echo "please follow instruction in README"; exit 2)
export JUJU_REPOSITORY=$PWD/clearwater-juju/charms 

#if in need for more power#juju set-constraints 'instance-type=m3.medium'
juju-deployer -r 2 -c bundle-nfv-demo.yaml -c bundle-config.yaml
