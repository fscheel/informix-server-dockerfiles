#!/bin/bash
#
#  name:        informix_update_hostname.sh:
#  description: Update the hostname in various file(s) in the docker image 
#  Called by:   informix_entry.sh


### Update HOSTNAME in SQLHOST file
### SQLHOSTS file contains the previous HOSTNAME value
###
old_hostname=`grep "HOST NAME" $INFORMIXSQLHOSTS |awk '{print $5}' ` 
if [[ $env_STORAGE == "LOCAL" ]]
then
   sed -i "s/${old_hostname}/${HOSTNAME}/g" $INFORMIXSQLHOSTS
else
   sed -i "s/${old_hostname}/${HOSTNAME}/g" $INFORMIX_CONFIG_DIR/sqlhosts
fi


### Update HOSTNAME in WL config file
###
#sed -i "s/${old_hostname}/${HOSTNAME}/g" $INFORMIXSQLHOSTS
