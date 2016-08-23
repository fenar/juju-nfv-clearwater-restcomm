#!/bin/bash -e


# Try ping homer and homestead from ellis before adding user to check dns resolution

for DN in {0000..0009}; do juju action do clearwater-homestead/0 create-update-user number=\"$DN\" password=7kkzTyGW; done

DOMAIN=`juju ssh  clearwater-homestead/0 '. /etc/clearwater/config; echo $home_domain'`
echo 'users range from 0000@'$DOMAIN
echo 'to  0019@'$DOMAIN
echo ' with password 7kkzTyGW created'
echo "See clearwater doc to configure your clients"
