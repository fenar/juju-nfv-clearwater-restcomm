#!/bin/bash -e

## Try ping homer and homestead from ellis before adding user to check dns resolution

juju ssh clearwater-homestead/0 '. /etc/clearwater/config; for DN in {0000..0099} ; do echo sip:$DN@$home_domain,$DN@$home_domain,$home_domain,7kkzTyGW ; done > users.csv'

#juju ssh clearwater-homestead/0 "/usr/share/clearwater/homestead/src/metaswitch/crest/tools/bulk_autocomplete.py users.csv"
#juju ssh clearwater-homestead/0 "/usr/share/clearwater/homestead/src/metaswitch/crest/tools/bulk_create.py users.auto.csv"
juju ssh clearwater-homestead/0 "/usr/share/clearwater/crest/src/metaswitch/crest/tools/bulk_autocomplete.py users.csv"
juju ssh clearwater-homestead/0 "/usr/share/clearwater/crest/src/metaswitch/crest/tools/bulk_autocomplete.py users.auto.csv"

juju ssh clearwater-homestead/0 "./users.auto.create_homestead.sh"

TMP=`mktemp -d`
juju scp clearwater-homestead/0:~/*xdm* $TMP/
juju scp $TMP/*xdm* clearwater-homer/0:~/ 
juju ssh clearwater-homer/0 "./users.auto.create_xdm.sh"

DOMAIN=`juju ssh  clearwater-homestead/0 '. /etc/clearwater/config; echo $home_domain'`
echo 'users range from 0000@'$DOMAIN
echo 'to  0099@'$DOMAIN
echo ' with password 7kkzTyGW created'
echo "See clearwater doc to configure your clients"
