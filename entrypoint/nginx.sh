#!/bin/bash

mkdir -p ${NGINX_SITES_ENABLED_DIRECTORY}

site_templates=`ls /tmp/${NGINX_SITES_ENABLED_DIRECTORY}/*`
for site_template in $site_templates
do
  # echo "Substituting variables from ${site_template} to ${NGINX_SITES_ENABLED_DIRECTORY}/${site_template##*/}"
  envsubst < "${site_template}" > "${NGINX_SITES_ENABLED_DIRECTORY}/${site_template##*/}"
done

# echo "Substituting variables from /tmp/${NGINX_CONFIG_FILE_PATH} to ${NGINX_SITES_ENABLED_DIRECTORY}"
envsubst < "/tmp/${NGINX_CONFIG_FILE_PATH}" > "${NGINX_CONFIG_FILE_PATH}"
