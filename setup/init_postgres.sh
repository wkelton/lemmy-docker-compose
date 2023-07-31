#!/bin/bash

setup_dir="${1}"

# initialize postgres
docker-compose --env-file "${setup_dir}/env_override" up -d postgres

# wait on postgres initialization
echo "Waiting 15 seconds for postgres initialization to complete..."
timeout 15s docker-compose logs -f postgres

docker cp config/postgresql.conf lemmy-db:/var/lib/postgresql/data

docker-compose down

# source .env to get user/group settings
source "${setup_dir}/../.env"

docker-compose up lemmy-postgres-volume-provisioner
docker-compose run --entrypoint \
    "/bin/sh -c 'chown -R ${POSTGRES_UID}:${POSTGRES_GID} /var/lib/postgresql/data'" \
    lemmy-postgres-volume-provisioner
