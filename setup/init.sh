#!/bin/bash

setup_dir=$(dirname "${BASH_SOURCE[0]}")

# copy configs
"${setup_dir}/copy_configs.sh"

# initialize postgres
"${setup_dir}/init_postgres.sh" "${setup_dir}"

# tear down containers
docker-compose down

echo
echo "Initialization complete. When ready, run: docker-compose up -d"
echo
