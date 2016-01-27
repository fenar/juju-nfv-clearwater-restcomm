#!/bin/bash

set -e
echo "Getting the code from Clearwater project until direct from git deploy is possible"
UP=$PWD
[  -d clearwater-juju ]  && (cd clearwater-juju; git pull)
[  -d clearwater-juju ]  || git clone -b nogit https://github.com/thomnico/clearwater-juju.git clearwater-juju
cd $UP
# Temporary until merge in upstream
[ -d clearwater-juju/charms/trusty/dns ] && (cd clearwater-juju/charms/trusty/dns; git pull)
[ -d clearwater-juju/charms/trusty/dns ] || (mkdir -p clearwater-juju/charms/trusty/dns; git clone  https://github.com/chuckbutler/DNS-Charm.git clearwater-juju/charms/trusty/dns)

echo "Code should be up to date. If source git changed you must rm -rf clearwater-juju before running this script"
