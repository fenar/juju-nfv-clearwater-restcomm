#!/bin/bash

set -e
echo "Getting the code from Clearwater project until direct from git deploy is possible"

[  -d clearwater-juju ]  && (cd clearwater-juju; git pull)
[  -d clearwater-juju ]  || git clone -b dnsaas https://github.com/Metaswitch/clearwater-juju.git
