#!/usr/bin/env bash

# This command clean all the container, image, links and volumes related to the
# given docker-compose file.
# It's denstructive since it causes all volumes data loss

docker-compose rm -fsv
docker-compose up -d --force-recreate --remove-orphans
