#!/bin/bash

export PASSPHRASE=tagada

if (( $(date) == 01 )) ; then 
	mode=full
else
	mode=incremental
fi

duplicity --full-if-older-than 1M --encrypt-key C56DA --sign-key C56DA \
     --include="/var/spool/cyrus" \
     --include="/var/lib/cyrus" \
     --include="/var/lib/mysql" \
     --include="/var/www" \
     --include="/var/lib/ldap" \
     --include="/etc" \
     --include="/root" \
     --progress \
     --verbosity 8 \
     --exclude="**" /  ssh://16.17.16.38//sauvegardes/n7 \
     --log-file /var/log/duplicity.log

duplicity remove-older-than 2M  ssh://16.17.16.38//sauvegardes/n7 --force

unset PASSPHRASE

# list file
# duplicity  list-current-file  --encrypt-key C56DA --sign-key C56DA    ssh://16.17.16.38//sauvegardes/n7
