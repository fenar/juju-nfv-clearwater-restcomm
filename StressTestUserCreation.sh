#!/bin/bash -e

## Try ping homer and homestead from ellis before adding user to check dns resolution

juju ssh clearwater-homestead/0 '. /etc/clearwater/config; for DN in {2010000000..2010039999}; do echo sip:$DN@$home_domain,$DN@$home_domain,$home_domain,7kkzTyGW ; done > users.csv'

juju ssh clearwater-homestead/0 "/usr/share/clearwater/homestead/src/metaswitch/crest/tools/bulk_autocomplete.py users.csv"
juju ssh clearwater-homestead/0 "/usr/share/clearwater/homestead/src/metaswitch/crest/tools/bulk_create.py users.auto.csv"

# Pipe the output to /dev/null to avoid spam
juju ssh clearwater-homestead/0 "./users.auto.create_homestead.sh > /dev/null"

# No need to provision users in Homer - these aren't used in stress

DOMAIN=`juju ssh  clearwater-homestead/0 '. /etc/clearwater/config; echo $home_domain'`
echo "Users from 2010000000@$DOMAIN to 2010039999@$DOMAIN have been created (password 7kkzTyGW)"
echo "Use clearwater-sipp to run stress with these clients"
