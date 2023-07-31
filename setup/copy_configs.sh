#!/bin/bash

setup_dir=$(dirname "${BASH_SOURCE[0]}")

# source .env to get user/group settings
source "${setup_dir}/../.env"

# copy configs
docker-compose up lemmy-proxy-volume-provisioner lemmy-volume-provisioner 
docker cp config/nginx.conf lemmy-proxy-volume-provisioner:/config
docker cp config/config.hjson lemmy-volume-provisioner:/config

docker-compose run --entrypoint \
    "/bin/sh -c 'chown 101:101 /config/nginx.conf'" \
    lemmy-proxy-volume-provisioner
docker-compose run --entrypoint \
    "/bin/sh -c 'chown ${LEMMY_UID}:${LEMMY_GID} /config/config.hjson'" \
    lemmy-volume-provisioner
